//
//  ViewController.swift
//  GroceryLists
//
//  Created by Andy on 11/26/16.
//  Copyright © 2016 Arclite Technologies. All rights reserved.
//

import UIKit

class GroceryListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet var dataTableView: UITableView?
    
    let manager = GroceryDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load up the data for the app
        
    } 
    
    //every time view is about the appear (other is one-time)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        manager.loadData()
        dataTableView?.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = manager.data[indexPath.row].name
        
        //use the item list for the count to display
        let itemCount = manager.data[indexPath.row].items?.count
        cell.detailTextLabel?.text = "\(itemCount!) Items"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let listToDelete = manager.data[indexPath.row]
            confirmDelete(this: listToDelete, index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func confirmDelete(this item: GroceryList, index: Int) {
        //todo: confirm
        try? manager.deleteObject(obj: item, index: index)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if (dataTableView?.indexPathForSelectedRow != nil) {
            prepareForListSelector(for: segue, selectedIndex: (dataTableView?.indexPathForSelectedRow?.row)!)
        }
        else {
            prepareForListSelector(for: segue, selectedIndex: 0)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: UIView.areAnimationsEnabled)
    }
}


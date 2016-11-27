//
//  ViewController.swift
//  GroceryLists
//
//  Created by Andy on 11/26/16.
//  Copyright © 2016 Arclite Technologies. All rights reserved.
//

import UIKit

class GroceryListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var dataTableView: UITableView?
    
    let manager = GroceryDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load data in hopes that context will be present. probably not and I'm wasting more time.
        manager.loadData()
    }
    
    //every time view is about the appear (other is one-time)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //todo: put in init of manager?. Do this when we have real data.
        manager.data = manager.fetch()
        dataTableView?.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = manager.data[indexPath.row].name
        
        //use the item list for the count to display
        let items = manager.data[indexPath.row].items
        cell.detailTextLabel?.text = "\(items?.count) Items"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: UIView.areAnimationsEnabled)
        
        manager.selectedIndex = indexPath.row
    }
}


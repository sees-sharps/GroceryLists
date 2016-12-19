//
//  ViewController.swift
//  GroceryLists
//
//  Created by Andy on 11/26/16.
//  Copyright © 2016 Arclite Technologies. All rights reserved.
//

import UIKit

class GroceryItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ListSelector {
    internal var selectedIndex: Int?
    @IBOutlet var dataTableView: UITableView?
    
    let manager = GroceryDataManager.shared
    var selectedItems: NSOrderedSet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedItems = manager.data[selectedIndex!].items
    }
    
    //every time view is about the appear (other is one-time)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //manager.data = manager.fetch()
        dataTableView?.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        prepareForListSelector(for: segue, dataTableView: dataTableView)
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (selectedItems?.count)!
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let item = (selectedItems?[indexPath.row] as! GroceryItem)
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "Quantity: \(item.quantity)"
        
        return cell
    }
}


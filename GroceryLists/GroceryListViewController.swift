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
    }
    
    //every time view is about the appear (other is one-time)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //todo: put in init of manager?. Do this when we have real data.
        //manager.data = manager.fetch()
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
}


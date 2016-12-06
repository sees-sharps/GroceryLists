//
//  AddListViewController.swift
//  GroceryLists
//
//  Created by Andy on 11/26/16.
//  Copyright © 2016 Arclite Technologies. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, ListSelector {

    internal var selectedIndex: Int?
    let manager = GroceryDataManager.shared
    
    @IBOutlet weak var itemNameField: UITextField!
    @IBOutlet weak var itemQtyField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemNameField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func add() {
        do {
            try manager.createItem(dataItem: (name: itemNameField.text!, quantity: Int16(itemQtyField.text!)!, parentIndex: selectedIndex!))
        }
        catch {
            print(error)
        }
        
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
    
    @IBAction func cancelClick() {
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
}

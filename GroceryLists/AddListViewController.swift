//
//  AddListViewController.swift
//  GroceryLists
//
//  Created by Andy on 11/26/16.
//  Copyright © 2016 Arclite Technologies. All rights reserved.
//

import UIKit

class AddListViewController: UIViewController {

    let manager = GroceryDataManager.shared
    
    @IBOutlet weak var listNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func add() {
        do {
            try manager.createList(name: (listNameField?.text)!)
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

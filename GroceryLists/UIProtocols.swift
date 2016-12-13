//
//  UIProtocols.swift
//  GroceryLists
//
//  Created by Andy on 12/12/16.
//  Copyright © 2016 Arclite Technologies. All rights reserved.
//

import Foundation
import UIKit

protocol DismissableKeyboard {
    func dismissKeyboard()
}

extension UIViewController: DismissableKeyboard {
    @IBAction func dismissKeyboard() {
        view.endEditing(true)
    }
}

protocol CloseableController {
    func close()
}

extension UIViewController: CloseableController {
    @IBAction func close() {
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
}

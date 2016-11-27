//
//  GroceryItem+CoreDataProperties.swift
//  GroceryLists
//
//  Created by Andy on 11/26/16.
//  Copyright © 2016 Arclite Technologies. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension GroceryItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroceryItem> {
        return NSFetchRequest<GroceryItem>(entityName: "GroceryItem");
    }

    @NSManaged public var name: String?
    @NSManaged public var quantity: Int16

}

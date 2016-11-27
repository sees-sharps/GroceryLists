//
//  GroceryDataManager.swift
//  CoreDataTest
//
//  Created by Clingman, Andy on 11/26/16.
//  Copyright © 2016 Andy Clingman. All rights reserved.
//

import CoreData

enum DataError: Error {
    case BadManagedObjectContext(String)
    case BadEntity(String)
}

class GroceryDataManager {
    
    static var shared: GroceryDataManager = GroceryDataManager()
    var managedObjectContext: NSManagedObjectContext?
    
    var data: [GroceryList]
    
    private init() {
        //set up the test data for now
        
        data = [GroceryList]()
        
        //set up the list
        let listItem = GroceryList()
        listItem.name = "Costco";
        
        //set up a couple of items
        let grocItem = GroceryItem()
        grocItem.name = "String Cheese"
        grocItem.quantity = 1;
        
        let grocItem2 = GroceryItem()
        grocItem2.name = "Avocados"
        grocItem2.quantity = 3
        
        listItem.addToItems(grocItem)
        listItem.addToItems(grocItem2)
        
        data.append(listItem)
        
        //set up the list
        let listItem2 = GroceryList()
        listItem.name = "Marc's";
        
        //set up a couple of items
        let grocItem3 = GroceryItem()
        grocItem3.name = "Deodorant"
        grocItem3.quantity = 2;
        
        let grocItem4 = GroceryItem()
        grocItem4.name = "Rockstar Energy Drink"
        grocItem4.quantity = 4
        
        listItem2.addToItems(grocItem3)
        listItem2.addToItems(grocItem4)
        
        data.append(listItem2)
    }
    
    func set(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    func fetch<T: NSManagedObject>() -> [T] {
        var result: [T]? = nil
        managedObjectContext?.performAndWait { [weak self] in
            do {
                result = try self?.executeFetechRequest()
            }
            catch {
                print(error)
            }
        }
        return result ?? []
    }
    
    private func executeFetechRequest<T: NSManagedObject>() throws -> [T]? {
        let request = T.fetchRequest()
        return try request.execute() as? [T]
    }
    
    func createList(name: (String)) throws {
        guard let ctx = managedObjectContext else {
            throw DataError.BadManagedObjectContext("The managed object context was nil")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "GroceryList", in: ctx) else {
            throw DataError.BadEntity("The entity description was bad")
        }
        
       let obj = GroceryList(entity: entity, insertInto: ctx)
        obj.name = name
        
        try? save()
    }
    
    func createItem(data: (name: String, quantity: Int16)) throws {
        guard let ctx = managedObjectContext else {
            throw DataError.BadManagedObjectContext("The managed object context was nil")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "GroceryItem", in: ctx) else {
            throw DataError.BadEntity("The entity description was bad")
        }
        
        let obj = GroceryItem(entity: entity, insertInto: ctx)
        obj.name = data.name
        obj.quantity = data.quantity
        
        try? save()
    }
    
    func save() throws {
        try managedObjectContext?.save()
    }
}

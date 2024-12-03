//
//  CoreDataController.swift
//  RememberMeApp
//
//  Created by Daniil on 02/12/2024.
//

import Foundation
import CoreData

class CoreDataController {
    static let shared = CoreDataController()
    let presistenceContainer: NSPersistentContainer
    
    private init() {
        presistenceContainer = NSPersistentContainer(name: "DecksData")
        presistenceContainer.loadPersistentStores { _, error in
            if let error = error {
                print("Could not load data from CoreData! Fatal Error: \(String(describing: error))")
            } else {
                print("Data loaded from CoreData!")
            }
        }
    }
    
    func saveContext() {
        guard presistenceContainer.viewContext.hasChanges else {return}
        do {
            try presistenceContainer.viewContext.save()
        } catch {
            print("Faild to save data to CoreData!")
        }
    }
}

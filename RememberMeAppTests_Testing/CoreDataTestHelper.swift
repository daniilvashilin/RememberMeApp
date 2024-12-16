//
//  CoreDataTestHelper.swift
//  RememberMeAppTests_Testing
//
//  Created by Daniil on 14/12/2024.
//

import Foundation
import CoreData

class CoreDataTestHelper {
    static let shared = CoreDataTestHelper()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DecksData") // Замени на имя твоей модели
        let description = container.persistentStoreDescriptions.first
        description?.type = NSInMemoryStoreType // In-memory store
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}

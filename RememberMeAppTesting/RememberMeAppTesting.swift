//
//  RememberMeAppTesting.swift
//  RememberMeAppTesting
//
//  Created by Daniil on 02/12/2024.
//

import XCTest
import CoreData
@testable import RememberMeApp

final class RememberMeAppTesting: XCTestCase {
    var persistentContainer: NSPersistentContainer!
    var context: NSManagedObjectContext!
    var userDataModel: UserDataModel!
    
    
    override func setUpWithError() throws {
        persistentContainer = NSPersistentContainer(name: "DecksData")
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        persistentContainer.persistentStoreDescriptions = [description]
        
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                XCTAssertNil(error, "Ошибка загрузки хранилища: \(error.localizedDescription)")
            }
        }
        context = persistentContainer.viewContext
        userDataModel = UserDataModel(context: context)
    }
    
    override func tearDownWithError() throws {
        persistentContainer = nil
        context = nil
        userDataModel = nil
    }
    
    func testFetchDeck() throws {
        let deck1 = CustomUserDeck(context: context)
        deck1.name = "Deck 1"

        let deck2 = CustomUserDeck(context: context)
        deck2.name = "Deck 2"
        
        try context.save()
        userDataModel.fetchDeck()
        
        XCTAssertEqual(userDataModel.deckStore.count, 2, "Ожидалось 2 колоды")
        XCTAssertEqual(userDataModel.deckStore[0].name, "Deck 1", "Название первой колоды не совпадает")
        XCTAssertEqual(userDataModel.deckStore[1].name, "Deck 2", "Название второй колоды не совпадает")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

//
//  RememberMeAppTests_Testing.swift
//  RememberMeAppTests_Testing
//
//  Created by Daniil on 13/12/2024.
//

import XCTest
import SwiftUI
import CoreData
@testable import RememberMeApp


class CoreDataCRUDTests_Testing: XCTestCase {
    var coreDataHelper: CoreDataTestHelper!
    
    override func setUp() {
        super.setUp()
        coreDataHelper = CoreDataTestHelper()
    }
    override func tearDown() {
        coreDataHelper = nil
        super.tearDown()
    }
    
    func testCreateDeck() throws {
        let context = coreDataHelper.persistentContainer.viewContext
        let deck = CustomUserDeck(context: context)
        deck.name = "Test Deck"
        
        try context.save()
        
        let request: NSFetchRequest<CustomUserDeck> = CustomUserDeck.fetchRequest()
        let decks = try context.fetch(request)
        
        XCTAssertEqual(decks.count, 1, "Added correct in to deck")
        XCTAssertEqual(deck.name, "Test Deck")
    }
    
    func testDeleteDeck() throws {

        let context = coreDataHelper.persistentContainer.viewContext
        let deck = CustomUserDeck(context: context)
        deck.name = "Test Deck"
        try context.save()

        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = CustomUserDeck.fetchRequest()
        var decks = try context.fetch(fetchRequest)
        XCTAssertEqual(decks.count, 1, "less one deck in the deck before delete")
        
        for deck in decks {
            if let deck = deck as? NSManagedObject {
                context.delete(deck)
            }
        }
        try context.save()
        
        decks = try context.fetch(fetchRequest)
        XCTAssertEqual(decks.count, 0, "All decks must be deleted")
    }
     
    func testAddCard() throws {
        let context = coreDataHelper.persistentContainer.viewContext
        let deck = CustomUserDeck(context: context)
        deck.name = "Test Deck"
        try context.save()
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = CustomUserDeck.fetchRequest()
        let decks = try context.fetch(fetchRequest)
        XCTAssertEqual(decks.count, 1, "less one deck in the deck")
        XCTAssertEqual(deck.name, "Test Deck")

        let newCard = Cards(context: context)
        newCard.word = "word"
        newCard.translate = "translation"
        newCard.userDeck = deck
        
        XCTAssertEqual(deck.userDeck?.count, 1, "less one card in the deck")
        XCTAssertFalse(decks.isEmpty)
    }
    
    
    func testDeleteCard() throws {
        let context = coreDataHelper.persistentContainer.viewContext
        let deck = CustomUserDeck(context: context)
        deck.name = "Test Deck"
        try context.save()
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = CustomUserDeck.fetchRequest()
        let decks = try context.fetch(fetchRequest)
        XCTAssertEqual(decks.count, 1, "less one deck in the deck")
        XCTAssertEqual(deck.name, "Test Deck")
        
        let newCard = Cards(context: context)
        newCard.word = "word"
        newCard.translate = "translation"
        newCard.userDeck = deck
        
        let userDataModel = UserDataModel(context: context)
        userDataModel.deleteCard(newCard)
        try context.save()
        
        XCTAssertEqual(deck.userDeck?.count, 0, "Card was deleted")
    }
    
    func testMultipleDeleteCards() throws {
        let context = coreDataHelper.persistentContainer.viewContext
        let deck = CustomUserDeck(context: context)
        deck.name = "Test Deck"
        try context.save()
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = CustomUserDeck.fetchRequest()
        let decks = try context.fetch(fetchRequest)
        XCTAssertEqual(decks.count, 1, "less one deck in the deck")
        XCTAssertEqual(deck.name, "Test Deck")
        
        let newCard = Cards(context: context)
        newCard.word = "word"
        newCard.translate = "translation"
        newCard.userDeck = deck
        
        let newCardSecond = Cards(context: context)
        newCardSecond.word = "word2"
        newCardSecond.translate = "translation2"
        newCardSecond.userDeck = deck
        
        let userDataModel = UserDataModel(context: context)
        userDataModel.deleteCard(newCard)
        try context.save()
        
        XCTAssertEqual(deck.userDeck?.count, 1, "Card was deleted")
        
        userDataModel.deleteCard(newCardSecond)
        try context.save()
        let cardFetchRequest: NSFetchRequest<Cards> = Cards.fetchRequest()
        _ = try context.fetch(cardFetchRequest)
        
        XCTAssertEqual(deck.userDeck?.count, 0, "Card was deleted")
    }
    
    func testGetCount() throws {
        let context = coreDataHelper.persistentContainer.viewContext
        let deck = CustomUserDeck(context: context)
        deck.name = "Test Deck"
        try context.save()
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = CustomUserDeck.fetchRequest()
        let decks = try context.fetch(fetchRequest)
        XCTAssertEqual(decks.count, 1, "less one deck in the deck")
        XCTAssertEqual(deck.name, "Test Deck")
        
        let newCard = Cards(context: context)
        newCard.word = "word"
        newCard.translate = "translation"
        newCard.userDeck = deck
        
        XCTAssertEqual(deck.userDeck?.count, 1, "less one card in the deck")
        
        let userDataModel = UserDataModel(context: context)
        let cardCount = userDataModel.getCardCount(for: deck)
        
        XCTAssertEqual(cardCount, 1, "Card amount equal 1")
        
    }
    
    func testEditingCard() throws {
        let context = coreDataHelper.persistentContainer.viewContext
        let deck = CustomUserDeck(context: context)
        deck.name = "Test Deck"
        try context.save()
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = CustomUserDeck.fetchRequest()
        let decks = try context.fetch(fetchRequest)
        XCTAssertEqual(decks.count, 1, "less one deck in the deck")
        XCTAssertEqual(deck.name, "Test Deck")
        
        let newCard = Cards(context: context)
        newCard.word = "word"
        newCard.translate = "translation"
        newCard.userDeck = deck
        try context.save()
        XCTAssertEqual(deck.userDeck?.count, 1, "less one card in the deck")
        
        let userDataModel = UserDataModel(context: context)
        
        userDataModel.editCard(newCard, newWord: "newWord", newTranslation: "newTranslation")
        try context.save()
        
        XCTAssertEqual(deck.userDeck?.count, 1, "less one card in the deck")
        XCTAssertEqual(newCard.word, "newWord")
        XCTAssertEqual(newCard.translate, "newTranslation")
        
        let cardFetchRequest: NSFetchRequest<Cards> = Cards.fetchRequest()
        let cards = try context.fetch(cardFetchRequest)
        XCTAssertEqual(cards.first?.word, "newWord", "need's to be newWord")
        
    }
    
    func testEditingDeck() throws {
        let context = coreDataHelper.persistentContainer.viewContext
        let deck = CustomUserDeck(context: context)
        deck.name = "Test Deck"
        try context.save()
        
        XCTAssertEqual(deck.name, "Test Deck")
        
        let userDataModel = UserDataModel(context: context)
        userDataModel.editDeck(deck, newName: "New Deck")
        try context.save()
        
        
        XCTAssertEqual(deck.name, "New Deck")
        
        let deckFetchRequest: NSFetchRequest<CustomUserDeck> = CustomUserDeck.fetchRequest()
            let decks = try context.fetch(deckFetchRequest)
            XCTAssertEqual(decks.first?.name, "New Deck", "Имя колоды должно быть обновлено в базе данных")
    }
}



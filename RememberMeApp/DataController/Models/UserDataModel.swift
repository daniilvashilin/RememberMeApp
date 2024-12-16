//
//  UserDataModel.swift
//  RememberMeApp
//
//  Created by Daniil on 02/12/2024.
//

import Foundation
import CoreData

class UserDataModel: ObservableObject {
    @Published var deckStore: [CustomUserDeck] = []
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        // fetch
    }
    
    func fetchDecks() {
        let request: NSFetchRequest<CustomUserDeck> = CustomUserDeck.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \CustomUserDeck.name, ascending: true)]
        
        do {
            deckStore = try context.fetch(request)
            print("Fetched decks: \(deckStore.map { $0.name ?? "Unnamed Deck" })")
        } catch {
            print("Failed to fetch decks: \(error.localizedDescription)")
        }
    }
    
    func addDeck(name: String) {
        let newDeck = CustomUserDeck(context: context)
        newDeck.name = name
        saveContext()
        fetchDecks() // Обновляем список
    }
    
    func fetchCards(for deck: CustomUserDeck) -> [Cards] {
        guard let cardsSet = deck.userDeck as? Set<Cards> else { return [] }
        return Array(cardsSet).sorted(by: { $0.word ?? "" < $1.word ?? "" }) // Сортируем по слову
    }
    
    func addCard(to deck: CustomUserDeck, word: String, translation: String) {
           let newCard = Cards(context: context)
           newCard.word = word
           newCard.translate = translation
           newCard.userDeck = deck
           saveContext()
        
       }
    
    func getCardCount(for deck: CustomUserDeck) -> Int {
        let cards = deck.userDeck as? Set<Cards> ?? []
        return cards.count
    }
    
    func getCards(for deck: CustomUserDeck) -> [Cards] {
          guard let cardsSet = deck.userDeck as? Set<Cards> else { return [] }
          return Array(cardsSet)
        
      }
    
    func deleteDeck(_ deck: CustomUserDeck) {
           context.delete(deck)
           saveContext()
           fetchDecks() // Обновляем список
       }
    
    func deleteCard(_ card: Cards) {
            context.delete(card)
            saveContext()
        }
    
    func editCard(_ card: Cards, newWord: String, newTranslation: String) {
        card.word = newWord
        card.translate = newTranslation
        saveContext()
        do {
            try context.save() // Сохраняем изменения в Core Data
            print("Card edited successfully: \(card.word ?? "Unknown")")
        } catch {
            print("Failed to edit card: \(error.localizedDescription)")
        }
    }
    
    func editDeck(_ deck: CustomUserDeck, newName: String) {
        deck.name = newName
        saveContext()
        fetchDecks()
        do {
            try context.save() // Сохраняем изменения в Core Data
            print("Deck edited successfully: \(deck.name ?? "Unknown")")
        } catch {
            print("Failed to edit Deck: \(error.localizedDescription)")
        }
    }
    
    func clearDecks() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = CustomUserDeck.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(deleteRequest)
            saveContext()
            deckStore.removeAll() // Очищаем локальный массив
            print("Все колоды успешно удалены!")
        } catch {
            print("Ошибка удаления всех колод: \(error.localizedDescription)")
        }
    }
    
    private func saveContext() {
        do {
            try context.save()
            print("Changes saved to Core Data.")
        } catch {
            print("Failed to save changes: \(error.localizedDescription)")
        }
    }
    
}

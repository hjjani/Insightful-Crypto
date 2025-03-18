//
//  PortfolioDataService.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 3/17/25.
//
// PortfolioDataService manages the portfolio data using Core Data.
// It allows for saving, fetching, updating, and deleting portfolio entries.

import Foundation
import CoreData

class PortfolioDataService {

    // Core Data container and properties for accessing and manipulating portfolio data.
    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer"
    private let entityName: String = "PortfolioEntity"

    // Published property to hold the list of saved portfolio entities.
    @Published var savedEntities: [PortfolioEntity] = []

    // Initializer sets up the Core Data stack and loads persistent stores.
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (_, error) in
            if let error = error {
                print("Error loading Core Data! \(error)")
            }
            self.getPortfolio()
        }
    }
    
    // MARK: PUBLIC

    // This function is responsible for updating the portfolio.
    // If the coin already exists, it will either update or delete it based on the amount.
    func updatePortfolio(coin: CoinModel, amount: Double) {
        
        // check if coin is already in portfolio
        if let entity = savedEntities.first(where: { $0.coinID == coin.id }) {
            // If amount is positive, update the existing entity; if not, delete it
            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                delete(entity: entity)
            }
        } else {
            // If the coin is not found, add a new entity
            add(coin: coin, amount: amount)
        }
        
    }
    
    // MARK: PRIVATE

    // Fetches the portfolio entities from Core Data
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
        do {
            // Fetch saved entities and assign them to the published property
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching Portfolio Entities. \(error)")
        }
    }

    // Adds a new portfolio entry (coin and amount) to Core Data
    private func add(coin: CoinModel, amount: Double) {
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChanges()
    }

    // Updates the amount of an existing portfolio entry
    private func update(entity: PortfolioEntity, amount: Double) {
        entity.amount = amount
        applyChanges()
    }

    // Deletes a portfolio entry from Core Data
    private func delete(entity: PortfolioEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }

    // Saves the changes to Core Data
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to Core Data. \(error)")
        }
    }

    // Applies changes (save and fetch updated data)
    private func applyChanges() {
        save()
        getPortfolio()
    }
    
}

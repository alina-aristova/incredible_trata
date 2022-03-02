//
//  DefaultsManager.swift
//  incredible_trata
//
//  Created by Ryabin Kirill on 27.10.2021.
//

import CoreData
import Foundation

class DefaultsManager {
    static let shared = DefaultsManager()

    func populateCoreDataIfNeeded() {
        populateCategories()
        populateCurrencies()
        setUserSettings()
    }

    private func setUserSettings() {
        guard CoreDataManager.shared.getUserSettings() == nil else { return }

        CoreDataManager.shared.setUserSettings()
    }

    private func populateCurrencies() {
        guard countItems(of: Currency.self) == 0 else { return }
        CoreDataManager.shared.populateCurrency(with: Constants.defaultCurrencyValues)
    }

    private func populateCategories() {
        guard countItems(of: Category.self) == 0 else { return }
        CoreDataManager.shared.fillingAllCategories()
    }

    private func countItems(of managedObject: NSManagedObject.Type) -> Int {
        let managedContext = CoreDataManager.shared.context

        do {
            let currencyItems = try managedContext.fetch(managedObject.fetchRequest())
            return currencyItems.count
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return 0
    }
}

// MARK: - Constants
extension DefaultsManager {
    private enum Constants {
        static let defaultCurrencyValues = [
            CurrencyValueModel(symbol: "$",
                               name: "United State Dollar",
                               shortName: "USD"),
            CurrencyValueModel(symbol: "₽",
                               name: "Russian Ruble",
                               shortName: "RUB"),
            CurrencyValueModel(symbol: "£",
                               name: "British Pound",
                               shortName: "GBP"),
            CurrencyValueModel(symbol: "¥",
                               name: "Japanese Yen",
                               shortName: "JPY"),
            CurrencyValueModel(symbol: "€",
                               name: "Euro",
                               shortName: "EUR")
        ]
    }
}

struct CurrencyValueModel {
     var symbol: String
     var name: String
     var shortName: String

     init(symbol: String, name: String, shortName: String) {
         self.symbol = symbol
         self.name = name
         self.shortName = shortName
     }
 }

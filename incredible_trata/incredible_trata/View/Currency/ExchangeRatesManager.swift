//
//  ExchangeRatesManager.swift
//  incredible_trata
//
//  Created by Aristova Alina on 17.11.2021.
//  
//

import Foundation

class ExchangeRatesManager {
    static let shared = ExchangeRatesManager()

    // MARK: - Private Properties
    private var exchangeRates: ExchangeRates?
    private var records: [Record] = CoreDataManager.shared.getRecords()
    private var selectedCurrency: Currency?

    // MARK: - public methods
    func updateCurrency() {
        records.forEach { item in
            item.amount = item.amount *
            (exchangeRates?.quotes["USD\((selectedCurrency?.shortName)!)"])! /
            (exchangeRates?.quotes["USD\((item.currency?.shortName)!)"])!
            item.amount = item.amount.rounded(digits: 2)
        }
        records.forEach { item in
            item.currency = selectedCurrency
        }
        CoreDataManager.shared.setUserSelected(selectedCurrency!)
        CoreDataManager.shared.saveContext()
    }
}

extension ExchangeRatesManager {
    func setExchangeRates(exchangeRates: ExchangeRates?) {
        self.exchangeRates = exchangeRates
    }

    func currencyWasSelected(currency: Currency) {
        self.selectedCurrency = currency
    }
}

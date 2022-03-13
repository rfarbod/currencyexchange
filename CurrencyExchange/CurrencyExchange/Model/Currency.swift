//
//  Currency.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import Foundation

struct Currency: Equatable, Identifiable,Hashable {
    
    let id = UUID()
    let symbol: CurrencySymbols
    let code: CurrencyCodes
    
    init(with code: CurrencyCodes) {
        self.code = code
        switch code {
        case .EUR:
            symbol = .EUR
        case .USD:
            symbol = .USD
        case .GBP:
            symbol = .GBP
        case .JPY:
            symbol = .JPY
        }
    }
    
    static func getAllCurrencies() -> [Currency] {
        var allCurrencies = [Currency]()
        for each in CurrencyCodes.allCases {
            allCurrencies.append(Currency(with: each))
        }
        return allCurrencies
    }
}

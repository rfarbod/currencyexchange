//
//  Currency.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import Foundation

struct Currency: Equatable {
    
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
        case .TRY:
            symbol = .TRY
        case .CHF:
            symbol = .CHF
        case .CAD:
            symbol = .CAD
        }
    }
}

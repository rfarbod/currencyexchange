//
//  Constants.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import Foundation


enum Path {
    
    enum Exchange {
        public static func exchangeCurrency(fromAmount: Double, fromCurrency: CurrencyCodes, toCurrency: CurrencyCodes) -> String {
            return "exchange/\(fromAmount)-\(fromCurrency.rawValue)/\(toCurrency.rawValue))/lastest"
        }
    }
}

//
//  Balance.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import Foundation


struct Balance {
    
    var amount: Double = 0
    var currency: Currency = Currency(symbol: CurrencySymbols.USD, code: CurrencyCodes.USD)
}

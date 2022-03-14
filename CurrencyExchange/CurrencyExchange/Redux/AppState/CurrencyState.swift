//
//  CurrencyState.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import Foundation
import SwiftUIFlux

struct CurrencyState: FluxState {
    
    var selectedFromCurrency = Currency(with: .USD)
    var selectedToCurrency = Currency(with: .USD)
    var selectedFromAmount: Double = 1.0
    var selectedToAmount: Double = 1.0
    var preLoadedToAmount = Balance(amount: 1, currency: Currency(with: .USD))
    var exchangeRate = ExchangeRate(fromCurrency: Currency(with: .USD), toCurrency: Currency(with: .USD), exchangeRate: 1)
    var exchangeCount = 0
    var currentCommissionFee: Double = 0.0
}

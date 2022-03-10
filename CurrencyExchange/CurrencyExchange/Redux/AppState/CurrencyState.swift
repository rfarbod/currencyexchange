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
    var selectedToCurrency = Currency(with: .EUR)
    var desiredAmount = Double()
}

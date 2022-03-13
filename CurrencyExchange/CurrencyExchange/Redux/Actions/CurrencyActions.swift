//
//  CurrencyActions.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import Foundation
import SwiftUIFlux

struct CurrencyActions {
    
    struct SetFromCurrency: Action {
        let fromCurrency: Currency
    }
    
    struct SetFromCurrencyAmount: Action {
        let fromAmount: Double
    }
    
    struct SetToCurrencyAmount: Action {
        let toAmount: Double
    }
    
    struct SetToCurrency: Action {
        let toCurrency: Currency
    }
    
    struct SetExchangeRate: Action {
        let rate: Double
    }
    
    struct ConvertCurrency: Action {
        let fromAmount: Double
        let toCurrency: Currency
    }
}

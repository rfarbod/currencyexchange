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
        let amount: Double
    }
    
    struct SetToCurrency: Action {
        let toCurrency: Currency
    }
    
}

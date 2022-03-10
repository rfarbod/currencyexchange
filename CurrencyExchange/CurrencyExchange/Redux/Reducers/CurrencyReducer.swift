//
//  CurrencyReducer.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import Foundation
import SwiftUIFlux

func currenyStateReducer(state: CurrencyState, action: Action) -> CurrencyState {
    
    var state = state
    switch action {
    case let action as CurrencyActions.SetToCurrency:
        state.selectedToCurrency = action.toCurrency
    case let action as CurrencyActions.SetFromCurrency:
        state.selectedFromCurrency = action.fromCurrency
        state.desiredAmount = action.amount
    default:
        break
    }
    
    return state
    
}

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
    case let action as CurrencyActions.SetFromCurrencyAmount:
        state.selectedFromAmount = action.fromAmount
    case let action as CurrencyActions.SetExchangeRate:
        state.exchangeRate = ExchangeRate(fromCurrency: state.selectedFromCurrency, toCurrency: state.selectedToCurrency, exchangeRate: action.rate)
        store.dispatch(action: CurrencyActions.ConvertCurrency(fromAmount: state.selectedFromAmount, toCurrency: state.selectedToCurrency))
    case let action as CurrencyActions.ConvertCurrency:
        let exchangeRate = state.exchangeRate.exchangeRate
        let desiredAmount = action.fromAmount * exchangeRate
        state.preLoadedToAmount = Balance(amount: desiredAmount, currency: action.toCurrency)
        store.dispatch(action: CurrencyActions.SetToCurrencyAmount(toAmount: desiredAmount))
    case let action as CurrencyActions.SetToCurrencyAmount:
        state.selectedToAmount = action.toAmount
    default:
        break
    }
    
    return state
    
}

//
//  AppReducer.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import Foundation
import SwiftUIFlux

func appStateReducer(state: AppState, action: Action) -> AppState {
    var state = state
    state.balanceState = balanceStateReducer(state: state.balanceState, action: action)
    state.currencyState = currenyStateReducer(state: state.currencyState, action: action)
    
    return state
}

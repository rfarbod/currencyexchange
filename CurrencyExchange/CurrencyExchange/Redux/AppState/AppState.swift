//
//  AppState.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import Foundation

import SwiftUIFlux

struct AppState: FluxState {
    
    var currencyState = CurrencyState()
    var balanceState = BalanceState()
    
    
}

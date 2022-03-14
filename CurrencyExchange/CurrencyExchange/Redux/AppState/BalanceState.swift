//
//  BalanceState.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import Foundation
import SwiftUIFlux

struct BalanceState: FluxState {
    
    var balances = [
        Balance(amount: 0, currency: Currency(with: .USD)),
        Balance(amount: 1000, currency: Currency(with: .EUR)),
        Balance(amount: 0, currency: Currency(with: .GBP)),
        Balance(amount: 0, currency: Currency(with: .JPY))
    ]
    
    
}

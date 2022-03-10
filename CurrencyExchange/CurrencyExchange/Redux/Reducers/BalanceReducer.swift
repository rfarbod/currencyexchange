//
//  BalanceReducer.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import Foundation
import SwiftUIFlux

func balanceStateReducer(state: BalanceState, action: Action) -> BalanceState {
    var state = state
    switch action {
    case let action as BalanceActions.SetBalance:
        if let indexOfBalance = state.balances.firstIndex(where: { balance in
            return balance.currency == action.currency
        }){
            state.balances[indexOfBalance].amount = action.amount
        }else{
            state.balances.append(Balance(amount: action.amount, currency: action.currency))
        }
    default:
        break
    }
    return state
}
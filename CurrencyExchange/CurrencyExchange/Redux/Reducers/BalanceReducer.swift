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
            return balance.currency.symbol == action.currency.symbol
        }){
            state.balances[indexOfBalance].amount += action.amount
            if action.amount < 0 {
                state.balances[indexOfBalance].totalComissionFee += store.state.currencyState.currentCommissionFee
            }
        }else{
            state.balances.append(Balance(amount: action.amount, currency: action.currency))
        }
    default:
        break
    }
    return state
}

//
//  BalanceActions.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import Foundation
import SwiftUIFlux

struct BalanceActions {
    
        struct GetExchangeRate: AsyncAction {
            
            func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
                
                guard let state = state as? AppState else {
                    return
                }
                let urlRequest = Endpoints.exchange( state.currencyState.selectedFromCurrency.code, state.currencyState.selectedToCurrency.code).resolve()
                NetworkService.default.execute(urlRequest, model: BalanceResult.self) { result in
                    switch result {
                    case let .success(response):
                        print(response)
                        if let doubleAmount = Double(response.amount) {
                            dispatch(CurrencyActions.SetExchangeRate(rate: doubleAmount/1000))
                            dispatch(CurrencyActions.ConvertCurrency(fromAmount: state.currencyState.selectedFromAmount, toCurrency: state.currencyState.selectedToCurrency))
                        }
                    case let .failure(error):
                        print(error)
                    }
                }
            }
            
            
        }

    
   
    struct SetBalance: Action {
        let currency: Currency
        let amount: Double
    }
}

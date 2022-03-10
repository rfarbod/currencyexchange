//
//  BalanceActions.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import Foundation
import SwiftUIFlux

struct BalanceActions {
    
        struct Exchange: AsyncAction {
            func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
                
                guard let state = state as? AppState else {
                    return
                }
                let urlRequest = Endpoints.exchange(state.currencyState.desiredAmount, state.currencyState.selectedFromCurrency.code, state.currencyState.selectedToCurrency.code).resolve()
                NetworkService.default.execute(urlRequest, model: BalanceResult.self) { result in
                    switch result {
                    case let .success(response):
                        var currencyCode = CurrencyCodes.USD
                        let currency = response.currency
                        for each in CurrencyCodes.allCases {
                            if each.rawValue == currency {
                                currencyCode = each
                            }
                        }
                        dispatch(SetBalance(currency: Currency(with: currencyCode), amount: Double(response.amount)!))
                    case let .failure(error):
                        print(error)
                    }
                }
            }
            
            
        }

    
    struct SetBalance: Action{
        let currency: Currency
        let amount: Double
    }
}

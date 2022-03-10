//
//  Endpoints.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import Foundation

enum Endpoints {
    case exchange(Double,CurrencyCodes,CurrencyCodes)
}

extension Endpoints {
    
    func resolve() -> URLRequestBuilder {
        switch self {
        case .exchange(let amount, let fromCurrency, let toCurrency):
            return ExchangeAPIs.exchange(amount, fromCurrency, toCurrency)
        }
    }
}

//
//  ExchangeAPI.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import Foundation
import Alamofire

enum ExchangeAPIs: URLRequestBuilder {
    
    case exchange(Double,CurrencyCodes,CurrencyCodes)
    
    
}

extension ExchangeAPIs {
    var path: String {
        switch self {
        case .exchange(let amoount, let fromCode, let toCode):
            return Path.Exchange.exchangeCurrency(fromAmount: amoount, fromCurrency: fromCode, toCurrency: toCode)
        }
    }
}

extension ExchangeAPIs {
    var parameters: Parameters? {
        return nil
    }
}

extension ExchangeAPIs {
    var method: HTTPMethod {
        switch self {
        case .exchange:
            return .get
        }
    }
}

extension ExchangeAPIs {
    var headers: HTTPHeaders? {
        return nil 
    }
}

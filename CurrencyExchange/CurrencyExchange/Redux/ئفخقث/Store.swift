//
//  Store.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import Foundation
import SwiftUIFlux

let store = Store<AppState>(reducer: appStateReducer,
                            middleware: [loggingMiddleware],
                            state: AppState())

let loggingMiddleware: Middleware<AppState> = { dispatch, getState in
    return { next in
        return { action in
            return next(action)
        }
    }
}

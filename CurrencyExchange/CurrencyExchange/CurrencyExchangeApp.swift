//
//  CurrencyExchangeApp.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import SwiftUI
import SwiftUIFlux

@main
struct CurrencyExchangeApp: App {
    var body: some Scene {
        WindowGroup {
            StoreProvider(store: store) {
                ContentView()
            }
        }
    }
}

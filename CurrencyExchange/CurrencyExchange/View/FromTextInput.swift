//
//  TextInput.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/13/22.
//

import SwiftUI
import SwiftUIFlux


struct FromTextInput: View {
    @State  var text = ""
    
    @EnvironmentObject var store : Store<AppState>
    
    var preloadedToAmount: Balance {
        return store.state.currencyState.preLoadedToAmount
    }
    
    var body: some View {
        TextField("Enter amount", text: $text)
            .padding()
            .frame(height: 50)
            .cornerRadius(20)
            .background(OuterShadowBackground())
            .keyboardType(.decimalPad)
            .onChange(of: text) { newValue in
                
                    if let doubleNumber = Double(newValue) {
                        if store.state.currencyState.exchangeCount > 5 {
                            store.dispatch(action: CurrencyActions.SetCurrentCommission(amount: (0.7/100) * doubleNumber))
                        }
                        store.dispatch(action: CurrencyActions.SetFromCurrencyAmount(fromAmount: doubleNumber))
                        store.dispatch(action: CurrencyActions.ConvertCurrency(fromAmount: doubleNumber, toCurrency: store.state.currencyState.selectedToCurrency))
                  
            }
    }
}
}

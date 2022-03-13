//
//  TextInput.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/13/22.
//

import SwiftUI
import SwiftUIFlux
enum TextInputType {
    case from
    case to
}

struct TextInput: View {
    @State  var text = ""
    @State var textInputType = TextInputType.from
    
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
                switch textInputType {
                case .from:
                    if let doubleNumber = Double(newValue) {
                        store.dispatch(action: CurrencyActions.ConvertCurrency(fromAmount: doubleNumber, toCurrency: store.state.currencyState.selectedToCurrency))
                    }
                case .to:
                    break
                }
            }
    }
}

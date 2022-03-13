//
//  ExchangeView.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/13/22.
//

import SwiftUI
import SwiftUIFlux

struct ExchangeView: View {

    private var allCurrecnies = Currency.getAllCurrencies()
    @State private var fromAmount = ""
    @State private var toAmount = ""
    @State private var toCurrency: CurrencyCodes = .USD
    
    @EnvironmentObject var store : Store<AppState>
    
    var fromSymbol: CurrencySymbols {
        return store.state.currencyState.selectedFromCurrency.symbol
    }
    
    var preloadedToAmount: Balance {
        return store.state.currencyState.preLoadedToAmount
    }
    
    var body: some View {
        
        VStack(spacing: 20){
            HStack(spacing: 20){
                FromTextInput()
                
                Text(fromSymbol.rawValue)
                    .foregroundColor(.secondaryColor)
                    .padding()
                    .frame(height: 50)
            }
            .padding()
            .frame(height: 75)
            .background(InnerShadowBackground())
            
            HStack(spacing: 20){
                
                HStack{
                    Text(String(format: "%.2f", preloadedToAmount.amount))
                        .foregroundColor(.secondaryColor)
                        .padding()
                        .frame(height: 50)
                    Spacer()
                }
                
                Picker("", selection: $toCurrency) {
                    ForEach(allCurrecnies) { currency in
                        Text(currency.code.rawValue)
                            .tag(currency.code)
                    }
                }
                .accentColor(.secondaryColor)
                .pickerStyle(.menu)
                .frame(width: 50, height: 50)
                .cornerRadius(20)
                .background(OuterShadowBackground())
                .onChange(of: [self.toCurrency].publisher.first()) { newValue in
                    print(newValue)
                    store.dispatch(action: CurrencyActions.SetToCurrency(toCurrency: Currency(with: self.toCurrency)))
                    store.dispatch(action: BalanceActions.GetExchangeRate())
                }
            }
            .padding()
            .frame(height: 80)
            .background(InnerShadowBackground())
        }
        .padding()
    }
    
}

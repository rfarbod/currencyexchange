//
//  ContentView.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import SwiftUI
import SwiftUIFlux
import Neumorphic
import AlertToast

struct ContentView: View {
    
    @State var index = 0
    @State var shouldShowError: Bool = false
    @State var shouldShowSuccess: Bool = false
    
    @EnvironmentObject var store : Store<AppState>
    
    var fromCurrency: CurrencyCodes {
        return store.state.currencyState.selectedFromCurrency.code
    }
    var balances: [Balance] {
        return store.state.balanceState.balances
    }
    
    var totalCommissionFee: Double {
        return balances[index].totalComissionFee
    }
    
    var currentCommissionFee: Double {
        return store.state.currencyState.currentCommissionFee
    }
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(.secondaryColor)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(.mainColor)
    }
    
    var body: some View {
        ZStack {
            Color.mainColor.ignoresSafeArea()
            
            VStack(spacing: 15){
                Text("Exchange")
                    .foregroundColor(.secondaryColor)
                    .font(.largeTitle)
                    .padding(.top, 30)
                
                TabView(selection: $index) {
                    ForEach(0..<balances.count, id: \.self ){ i in
                        BalanceView(currency: balances[i].currency,amount: balances[i].amount)
                            .tag(i)
                            .frame(width: 225, height: 150)
                    }
                }
                .frame(height: 175)
                .tabViewStyle(.page(indexDisplayMode: .always))
                .onChange(of: index) { newValue in
                    print(newValue)
                    store.dispatch(action: CurrencyActions.SetFromCurrency(fromCurrency: balances[index].currency))
                    store.dispatch(action: BalanceActions.GetExchangeRate())
                }
                .onAppear {
                    store.dispatch(action: CurrencyActions.SetFromCurrency(fromCurrency: balances[index].currency))
                    store.dispatch(action: BalanceActions.GetExchangeRate())
                }
                
                ExchangeView()
                       
                Text("Comission fee: \(String(format: "%.2f", currentCommissionFee))")
                    .foregroundColor(.secondaryColor)
                    .font(.caption)
                
                Text("Total comission fee: \(String(format: "%.2f", totalCommissionFee))")
                    .foregroundColor(.secondaryColor)
                    .font(.caption)
                
                Button(action: {
                    let fromCurrency = store.state.currencyState.selectedFromCurrency
                    var fromAmount   = store.state.currencyState.selectedFromAmount
                    let toCurrency   =  store.state.currencyState.selectedToCurrency
                    let toAmount     =  store.state.currencyState.selectedToAmount
                    let fromBalance  = store.state.balanceState.balances.first { balance in
                        return balance.currency.symbol == fromCurrency.symbol
                    }?.amount
                    if fromAmount > fromBalance ?? 0 {
                        shouldShowError = true
                        shouldShowSuccess = false
                    }else {
                        shouldShowError = false
                        shouldShowSuccess = true
                        if store.state.currencyState.exchangeCount >= 5 {
                            fromAmount += currentCommissionFee
                            store.dispatch(action: CurrencyActions.SetCurrentCommission(amount: (0.7/100) * fromAmount))
                        }
                    store.dispatch(action: CurrencyActions.SetExchangeCount())
                    store.dispatch(action: BalanceActions.SetBalance(currency: fromCurrency, amount: -(fromAmount)))
                    store.dispatch(action: BalanceActions.SetBalance(currency: toCurrency, amount: toAmount))
                    }
                    
                }) {
                    Text("Exchange")
                        .fontWeight(.bold)
                }.softButtonStyle(Capsule(), pressedEffect: .hard)
    
                
                Spacer()
            }
        }.toast(isPresenting: $shouldShowError, duration: 3) {
            AlertToast(displayMode: .alert, type: .error(.red), title: "Balance Can't Be Lower Than 'from' Amount")
        }.toast(isPresenting: $shouldShowSuccess) {
            AlertToast(displayMode: .alert, type: .complete(.green), title: "Exchange Was Successful")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

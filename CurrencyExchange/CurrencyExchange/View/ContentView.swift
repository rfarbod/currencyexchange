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
    @State var shouldShowAlert: Bool = false
    @EnvironmentObject var store : Store<AppState>
    
    var fromCurrency: CurrencyCodes {
        return store.state.currencyState.selectedFromCurrency.code
    }
    var balances: [Balance] {
        return store.state.balanceState.balances
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
                       
                Text("Comission fee: \(0)")
                    .foregroundColor(.secondaryColor)
                    .font(.caption)
                
                Text("Total comission fee: \(0)")
                    .foregroundColor(.secondaryColor)
                    .font(.caption)
                
                Button(action: {
                    let fromCurrency = store.state.currencyState.selectedFromCurrency
                    let fromAmount   = store.state.currencyState.selectedFromAmount
                    let toCurrency   =  store.state.currencyState.selectedToCurrency
                    let toAmount     =  store.state.currencyState.selectedToAmount
                    let fromBalance  = store.state.balanceState.balances.first { balance in
                        return balance.currency.symbol == fromCurrency.symbol
                    }?.amount
                    if fromAmount > fromBalance ?? 0 {
                        shouldShowAlert = true
                    }else {
                    store.dispatch(action: BalanceActions.SetBalance(currency: fromCurrency, amount: -(fromAmount)))
                    store.dispatch(action: BalanceActions.SetBalance(currency: toCurrency, amount: toAmount))
                    }
                    
                }) {
                    Text("Exchange")
                        .fontWeight(.bold)
                }.softButtonStyle(Capsule(), pressedEffect: .hard)
    
                
                Spacer()
            }
        }.toast(isPresenting: $shouldShowAlert, duration: 3) {
            AlertToast(displayMode: .alert, type: .error(.red), title: "Balance can't be lower than 'from' amount")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

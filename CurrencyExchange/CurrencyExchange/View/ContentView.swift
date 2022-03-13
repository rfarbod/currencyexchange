//
//  ContentView.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import SwiftUI
import SwiftUIFlux
import Neumorphic

struct ContentView: View {
    
    @State var index = 0
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
                    ForEach(0..<balances.count){ i in
                        BalanceView(currency: balances[i].currency, amount: balances[i].amount)
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
                
                ExchangeView()
                       
                Text("Comission fee: \(0)")
                    .foregroundColor(.secondaryColor)
                    .font(.caption)
                
                Text("Total comission fee: \(0)")
                    .foregroundColor(.secondaryColor)
                    .font(.caption)
                
                Button(action: {}) {
                    Text("Exchange")
                        .fontWeight(.bold)
                }.softButtonStyle(Capsule(), pressedEffect: .hard)
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

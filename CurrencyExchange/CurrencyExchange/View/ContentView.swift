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
    
    var body: some View {
        ZStack {
            Color.mainColor.ignoresSafeArea()
            
            VStack(spacing: 15){
                SectionTitle("Exchange")
                    .padding(.top, 30)
                
                TabView(selection: $index) {
                    ForEach(0..<balances.count){ i in
                        BalanceView(currency: balances[i].currency, amount: balances[i].amount)
                            .frame(width: 300, height: 200)
                            .tag(i)
                    }
                }
                .frame(height: 200)
                .tabViewStyle(.page)
                .onChange(of: index) { newValue in
                    print(newValue)
                    store.dispatch(action: CurrencyActions.SetFromCurrency(fromCurrency: balances[index].currency))
                    store.dispatch(action: BalanceActions.GetExchangeRate())
                }
                
                ExchangeView()
                
                Spacer()
                
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

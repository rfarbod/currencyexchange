//
//  BalanceView.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/11/22.
//

import SwiftUI

struct BalanceView: View {
    var currency: Currency
    var amount: Double
    
    var body: some View {
        ZStack {
            OuterShadowBackground()

            FlagBackground(image: currency.code.rawValue)

            HStack(alignment: .bottom, spacing: 2) {
                Text("\(String(format: "%.2f", amount))")
                    .foregroundColor(.secondaryColor)
                    .font(.title)
                    .bold()
                   
                Text(currency.symbol.rawValue)
                    .foregroundColor(.secondaryColor)
                    .font(.title2)
                    .bold()
                Spacer()
            }
            .padding(.leading, 15)
        }
        .padding()
    }
}

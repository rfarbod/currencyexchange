//
//  ToTextInput.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/13/22.
//

import Foundation
import SwiftUI
import SwiftUIFlux

struct ToTextInput: View {
    
    @State  var text = ""
    var title = ""
    
    var body: some View {
        
        TextField("\(title)", text: $text)
            .padding()
            .frame(height: 50)
            .cornerRadius(20)
            .background(OuterShadowBackground())
            .keyboardType(.decimalPad)
            
            
    }
}

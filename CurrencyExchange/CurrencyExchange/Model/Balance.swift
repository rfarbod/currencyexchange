//
//  Balance.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import Foundation


struct Balance: Identifiable {
    var id = UUID().uuidString
    
    
    var amount: Double = 0
    var currency: Currency = Currency(with: .USD)
    var totalComissionFee: Double = 0 
}

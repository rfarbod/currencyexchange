//
//  SectionTitle.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/13/22.
//

import SwiftUI

struct SectionTitle: View {
    var titleText = ""
    init(_ text: String) {
        titleText = text
    }
    var body: some View {
        Text(titleText)
            .foregroundColor(.secondaryColor)
            .font(.largeTitle)
    }
}

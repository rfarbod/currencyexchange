//
//  FlagBackground.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/13/22.
//

import SwiftUI

struct FlagBackground: View {
    var image: String
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: 225, height: 150)
            .clipped()
            .cornerRadius(20)
            .grayscale(0.8)
            .overlay(FlagGradient())
    }
}

fileprivate struct FlagGradient: View {
    var body: some View {
        LinearGradient(colors: [.mainColor,
                                .mainColor.opacity(0.8),
                                .mainColor.opacity(0.6),
                                .mainColor.opacity(0.4),
                                .mainColor.opacity(0.2),
                                .clear],
                       startPoint: .leading,
                       endPoint: .trailing)
            .cornerRadius(20)
    }
}

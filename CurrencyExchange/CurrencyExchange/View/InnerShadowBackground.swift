//
//  InnerShadowBackground.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/13/22.
//

import SwiftUI
import Neumorphic

struct InnerShadowBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.mainColor)
            .softInnerShadow(RoundedRectangle(cornerRadius: 20))
    }
}

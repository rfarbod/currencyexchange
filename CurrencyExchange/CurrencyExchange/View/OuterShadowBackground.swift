//
//  OuterShadowBackground.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/13/22.
//

import SwiftUI
import Neumorphic

struct OuterShadowBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.mainColor)
            .softOuterShadow()
    }
}


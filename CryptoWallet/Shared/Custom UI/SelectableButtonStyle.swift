//
//  SelectableButtonStyle.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI

struct SelectableButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        ZStack(alignment: .leading) {
            configuration.label
            
            if configuration.isPressed {
                Color.custom(.darkPink).opacity(0.25)
            }
        }
    }
}

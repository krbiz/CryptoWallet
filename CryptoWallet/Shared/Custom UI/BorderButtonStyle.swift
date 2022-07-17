//
//  BorderButtonStyle.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI

struct BorderButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.custom(.white))
            .padding(10)
            .background(
                Color.custom(.darkBlue)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(LinearGradient(gradient: Gradient(colors: [.custom(.lightPink), .custom(.darkPink)]), startPoint: .leading, endPoint: .trailing), lineWidth: 2)
            )
            .cornerRadius(12)
        .opacity(configuration.isPressed ? 0.5 : 1)
        .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

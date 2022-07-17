//
//  PinkButtonStyle.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI

struct PinkButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Capsule()
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.custom(.lightPink), .custom(.darkPink)]), startPoint: .leading, endPoint: .trailing)
                )
                .frame(height: 56)
            
            configuration.label
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.custom(.white))
        }
        .opacity(configuration.isPressed ? 0.5 : 1)
        .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
    
}

//
//  CustomTextField.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    let trailingText: String
    let bottomText: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                TextField("", text: $text)
                    .keyboardType(.decimalPad)
                    .placeholder(when: text.isEmpty) {
                        Text(placeholder)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.custom(.gray))
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.custom(.white))
                
                Text(trailingText)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.custom(.white))
            }
            
            LinearGradient(gradient: Gradient(colors: [.custom(.lightPink), .custom(.darkPink)]), startPoint: .leading, endPoint: .trailing)
                .frame(height: 1)
            
            Text(bottomText)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.custom(.gray))
        }
    }
}



struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(
            placeholder: "0",
            text: .constant(""),
            trailingText: "BTC",
            bottomText: "Available: 0 BTC")
    }
}

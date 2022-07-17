//
//  Color+custom.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI

extension Color {
    enum Name: String {
        case white = "white"
        case black = "black"
        case darkBlue = "darkBlue"
        case gray = "gray"
        case lightPink = "lightPink"
        case darkPink = "darkPink"
        case red = "red"
        case green = "green"
    }
    
    static func custom(_ type: Name) -> Color {
        return Color(type.rawValue)
    }
}

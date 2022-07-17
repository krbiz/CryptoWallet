//
//  Text+gradient.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI

extension Text {
    func foregroundLinearGradient(
        colors: [Color],
        startPoint: UnitPoint,
        endPoint: UnitPoint) -> some View
    {
        self.overlay(
            LinearGradient(
                colors: colors,
                startPoint: startPoint,
                endPoint: endPoint
            )
            .mask(self)
        )
    }
}

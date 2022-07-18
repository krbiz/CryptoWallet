//
//  ChartData.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI

struct ChartData {
    let data: [Double]
    let color: Color
}

// MARK: - Fake Data

extension ChartData {
    static func generateFakeData() -> [ChartData] {
        let chart1 = ChartData(data: [15, 17, 9, 23, 10, 23, 5], color: Color(#colorLiteral(red: 0.968627451, green: 0.5764705882, blue: 0.1019607843, alpha: 1)))
        let chart2 = ChartData(data: [6, 10, 1, 15, 0], color: Color(#colorLiteral(red: 0.2941176471, green: 0.4392156863, blue: 1, alpha: 1)))
        let chart3 = ChartData(data: [1, 4, -5, 4, 10], color: Color(#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)))
        let chart4 = ChartData(data: [-2, 17, 1, 10, 1], color: Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)))
        let chart5 = ChartData(data: [2, 5, 9, 23, 0], color: Color(#colorLiteral(red: 0.5563425422, green: 0.9793455005, blue: 0, alpha: 1)))
        return [chart1, chart2, chart3, chart4, chart5]
    }
}

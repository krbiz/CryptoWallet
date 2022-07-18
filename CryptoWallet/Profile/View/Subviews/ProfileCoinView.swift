//
//  ProfileCoinView.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI
import struct Kingfisher.KFImage

struct ProfileCoinView: View {
    let coin: Coin
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 10) {
                KFImage(URL(string: coin.image.small))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(coin.name)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.custom(.white))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(coin.symbol.uppercased())
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.custom(.gray))
                }
            }
            
            if let chartData = coin.chartData {
                LightChartView(data: chartData.data, type: .curved, visualType: .outline(color: chartData.color, lineWidth: 2))
                    .padding(.vertical, 10)
            }
            
            HStack {
                Text(coin.marketData.currentPrice.usd.currencyFormat)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.custom(.white))
                
                Spacer()
                
                PriceChangeView()
            }
        }
        .padding(16)
        .frame(width: 195, height: 155)
        .background(
            Color.custom(.white).opacity(0.12)
                .cornerRadius(18)
        )
    }
    
    // MARK: - Helpers
    
    private func PriceChangeView() -> some View {
        let value = coin.marketData.priceChange24hPercentage
        
        if value >= 0 {
            return HStack(spacing: 0) {
                Image("arrow-drop-up")
                
                Text(String(format: "%.2f%%", value))
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(.custom(.green))
            }
        } else {
            return HStack(spacing: 0) {
                Image("arrow-drop-down")
                
                Text(String(format: "%.2f%%", abs(value)))
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(.custom(.red))
            }
        }
    }
}

//struct ProfileCoinView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileCoinView()
//    }
//}

//
//  MarketCoinView.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI
import struct Kingfisher.KFImage

struct MarketCoinView: View {
    let coin: Coin
    
    var body: some View {
        HStack(spacing: 11) {
            KFImage(URL(string: coin.image.small))
                .resizable()
                .scaledToFill()
                .frame(width: 46, height: 46)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 7) {
                Text(coin.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.custom(.white))
                
                Text(coin.symbol.uppercased())
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.custom(.gray))
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 7) {
                Text(coin.marketData.currentPrice.usd.currencyFormat)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.custom(.gray))
                
                PriceChangeText()
                    .font(.system(size: 16, weight: .regular))
            }
        }
        .padding(.vertical, 21)
        .padding(.horizontal, 20)
        .background(
            Color.black.opacity(0.01)
        )
    }
    
    // MARK: - Helpers
    
    private func PriceChangeText() -> Text {
        let value = coin.marketData.priceChange24hPercentage
        
        if value >= 0 {
            return Text(String(format: "+%.2f%%", value))
                .foregroundColor(.custom(.green))
            
        } else {
            return Text(String(format: "%.2f%%", value))
                .foregroundColor(.custom(.red))
        }
    }
    
}

//struct CoinCell_Previews: PreviewProvider {
//    static var previews: some View {
//        MarketCoinView()
//    }
//}

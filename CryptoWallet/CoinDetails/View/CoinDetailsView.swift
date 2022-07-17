//
//  CoinDetailsView.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI

struct CoinDetailsView: View {
    @State var coin: Coin
    
    var body: some View {
        GeometryReader { reader in
            ScrollView {
                VStack(spacing: 0) {
                    Text(coin.marketData.currentPrice.usd.currencyFormat)
                        .font(.system(size: 32, weight: .semibold))
                        .foregroundColor(.custom(.white))
                        .padding(.top, 10)
                    
                    PriceChangeText()
                        .font(.system(size: 16, weight: .regular))
                        .padding(.top, 16)
                    
                    ZStack {
                        HStack(spacing: 0) {
                            VStack(alignment: .center, spacing: 7) {
                                Text("24h Low")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(.custom(.gray))
                                
                                Text("$ 45 848")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.custom(.white))
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .center, spacing: 7) {
                                Text("Volume (BTC)")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(.custom(.gray))
                                
                                Text("0.0387")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.custom(.white))
                            }
                        }
                        
                        VStack(alignment: .center, spacing: 7) {
                            Text("24h High")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(.custom(.gray))
                            
                            Text("$ 49300")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.custom(.white))
                        }
                    }
                    
                    .padding(.horizontal, 20)
                    .padding(.top, 26)
                    .padding(.bottom, 38)
                }
                .frame(maxWidth: .infinity)
                .background(
                    Rectangle()
                        .foregroundColor(.custom(.darkBlue))
                        .padding(.top, 30)
                        .cornerRadius(30)
                        .padding(.top, -30)
                )
            }
            
            VStack(spacing: 0) {
                Color.custom(.darkBlue)
                    .frame(maxWidth: .infinity)
                    .frame(height: reader.safeAreaInsets.top)
            }
            .ignoresSafeArea(edges: .top)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.custom(.black)
                .ignoresSafeArea()
        )
        .navigationTitle("\(coin.symbol.uppercased())/USD")
        .navigationBarTitleDisplayMode(.inline)
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

//struct CoinDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinDetailsView()
//    }
//}

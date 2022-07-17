//
//  CoinDetailsView.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI

struct CoinDetailsView: View {
    @State var coin: Coin
    @State var amount: String = "5"
    
    var body: some View {
        GeometryReader { reader in
            ScrollView {
                VStack(spacing: 0) {
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
                                    
                                    Text(coin.marketData.high24h.usd.currencyFormat)
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.custom(.white))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .center, spacing: 7) {
                                    Text("Volume (\(coin.symbol.uppercased()))")
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
                                
                                Text(coin.marketData.low24h.usd.currencyFormat)
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
                    
                    VStack(spacing: 32) {
                        CustomTextField(
                            placeholder: "0",
                            text: $amount,
                            trailingText: coin.symbol.uppercased(),
                            bottomText: "Available: 0 \(coin.symbol.uppercased())"
                        )
                        
                        CustomTextField(
                            placeholder: "0",
                            text: .constant(""),
                            trailingText: "USD",
                            bottomText: "Available: 0 USD"
                        )
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 42)
                    
                    HStack(spacing: 10) {
                        Button {
                            
                        } label: {
                            VStack(spacing: 10) {
                                Text("Buy \(coin.symbol.uppercased())")
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Text("1 067 620 USD ≈ 5 \(coin.symbol.uppercased())")
                                    .font(.system(size: 12, weight: .regular))
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(BorderButtonStyle())
                        .frame(maxWidth: .infinity)
                        
                        Button {
                            
                        } label: {
                            VStack(spacing: 10) {
                                Text("Sell \(coin.symbol.uppercased())")
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Text("5 \(coin.symbol.uppercased()) ≈ 86 672.7 USD")
                                    .font(.system(size: 12, weight: .regular))
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(BorderButtonStyle())
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 21)
                    
                    VStack(alignment: .leading, spacing: 18) {
                        Text("💸 About \(coin.symbol.uppercased())")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.custom(.white))
                        
                        Text("Bitcoin is a decentralized digital currency created in January 2009. It follows the ideas set out in a whitepaper by the mysterious and pseudonymous Satoshi Nakamoto.\n\nThe identity of the person or persons who created the technology is still a mystery. Bitcoin offers the ")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundLinearGradient(colors: [.custom(.white), .custom(.black)], startPoint: .top, endPoint: .bottom)
                            .lineSpacing(2)
                            .foregroundColor(.custom(.white))
                            .frame(height: 140)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 44)
                    
                    Button {
                        
                    } label: {
                        Text("Show more +")
                            .foregroundLinearGradient(colors: [.custom(.lightPink), .custom(.darkPink)], startPoint: .leading, endPoint: .trailing)
                            .font(.system(size: 16, weight: .semibold))
                    }
                    .padding(.top, 2)
                    
                    VStack(spacing: 12) {
                        HStack(spacing: 0) {
                            Text("Rank")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.custom(.white))
                                .padding(14)
                            
                            Spacer()
                            
                            Text("№1")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.custom(.gray))
                                .padding(14)
                        }
                        .background(
                            Color.custom(.darkBlue)
                                .cornerRadius(12)
                        )
                        
                        HStack(spacing: 0) {
                            Text("Launch Date")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.custom(.white))
                                .padding(14)
                            
                            Spacer()
                            
                            Text("January 3, 2009")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.custom(.gray))
                                .padding(14)
                        }
                        .background(
                            Color.custom(.darkBlue)
                                .cornerRadius(12)
                        )
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 24)
                    .padding(.bottom, 8)
                }
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
        .onTapGesture {
            // Hide Keyboard
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
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

//
//  MarketView.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI
import Introspect

struct MarketView: View {
    @StateObject private var viewModel = MarketViewModel()
    @State private var showDetails: Bool = false
    @State private var currentCoin: Coin?
    
    var body: some View {
        GeometryReader { reader in
            if viewModel.isFetched {
                ZStack {
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(viewModel.coins) { coin in
                                Button {
                                    currentCoin = coin
                                    showDetails = true
                                } label: {
                                    MarketCoinView(coin: coin)
                                }
                                .buttonStyle(SelectableButtonStyle())
                            }
                        }
                    }
                    .introspectScrollView { scrollView in
                        scrollView.indicatorStyle = .white
                    }
                }
                .overlay(
                    VStack(spacing: 0) {
                        Color.custom(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: reader.safeAreaInsets.top)
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .ignoresSafeArea(edges: .top)
                )
                .overlay(
                    NavigationLink(isActive: $showDetails, destination: {
                        if let coin = currentCoin {
                            CoinDetailsView(coin: coin)
                        }
                    }, label: {
                        EmptyView()
                    })
                )
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.custom(.black)
                .ignoresSafeArea()
        )
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .onLoad {
            viewModel.fetchData()
        }
    }
}

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView()
    }
}

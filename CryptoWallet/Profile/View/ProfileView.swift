//
//  ProfileView.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI
import struct Kingfisher.KFImage

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        GeometryReader { reader in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Welcome back, ")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.custom(.gray))
                            
                            Text("Matthew 👋🏻")
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundColor(.custom(.white))
                        }
                        
                        Spacer()
                        
                        KFImage(URL(string: "https://thispersondoesnotexist.com/image"))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 21)
                    
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [.custom(.lightPink), .custom(.darkPink)]), startPoint: .leading, endPoint: .trailing)
                            .frame(width: 90, height: 90)
                            .clipShape(Circle())
                            .frame(width: 180, height: 180)
                            .clipShape(Circle())
                            .blur(radius: 22.5)
                            .opacity(0.8)
                            .background(Color.custom(.darkBlue).opacity(0.5))
                            .clipShape(Circle())
                        
                        Text("$246.00")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.custom(.white))
                    }
                    .padding(.top, 32)
                    
                    HStack(spacing: 10) {
                        Button {
                            
                        } label: {
                            Text("Deposit")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 5)
                        }
                        .buttonStyle(BorderButtonStyle())
                        .frame(maxWidth: .infinity)
                        
                        Button {
                            
                        } label: {
                            Text("Withdraw")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 5)
                        }
                        .buttonStyle(BorderButtonStyle())
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 32)
                    
                    TrendingView()
                        .padding(.top, 42)
                    
                    NewsView()
                        .padding(.top, 42)
                        .padding(.bottom, 14)
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
    
    // MARK: - Subviews
    
    private func TrendingView() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("🔥 Trending")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.custom(.white))
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(viewModel.coins) { coin in
                        Button {
                            
                        } label: {
                            ProfileCoinView(coin: coin)
                        }
                        .buttonStyle(ScalableButtonStyle())
                    }
                }
                .padding(.horizontal, 20)
            }
            .frame(height: 155)
        }
    }
    
    private func NewsView() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("🪙 News")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.custom(.white))
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Show all")
                        .foregroundLinearGradient(colors: [.custom(.lightPink), .custom(.darkPink)], startPoint: .leading, endPoint: .trailing)
                        .font(.system(size: 16, weight: .semibold))
                }
            }
            .padding(.horizontal, 20)
            
            LazyVStack(spacing: 0) {
                ForEach(viewModel.news) { news in
                    Button {
                        
                    } label: {
                        ProfileNewsView(news: news)
                    }
                    .buttonStyle(SelectableButtonStyle())
                }
            }
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

//
//  ProfileNewsView.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI

struct ProfileNewsView: View {
    let news: News
    
    var body: some View {
        HStack(spacing: 23) {
            Image(news.image)
                .cornerRadius(6)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 10) {
                    Text(news.category)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.custom(.gray))
                    
                    Color.gray
                        .frame(width: 6, height: 6)
                        .clipShape(Circle())
                    
                    Text(news.date)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.custom(.gray))
                }
                
                Text(news.text)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.custom(.white))
                    .lineLimit(3)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }
}

struct ProfileNewsView_Previews: PreviewProvider {
    static var previews: some View {
        let news = News.generateFakeData()
        ProfileNewsView(news: news[0])
    }
}

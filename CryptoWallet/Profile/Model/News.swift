//
//  News.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import Foundation

struct News: Identifiable {
    let id: Int
    let image: String
    let category: String
    let date: String
    let text: String
}

// MARK: - Fake Data

extension News {
    static func generateFakeData() -> [News] {
        let news1 = News(
            id: 0,
            image: "profile-news-1",
            category: "Altcoin news",
            date: "6 min ago",
            text: "Six XRP Token Holders to Speak in Ripple-SEC Case as Circle Gets Subpoena"
        )
        
        let news2 = News(
            id: 1,
            image: "profile-news-2",
            category: "Bitcoin news",
            date: "6 min ago",
            text: "Bitcoin Eyes Key Upside Break, Outperforms Ethereum, DOGE Rallies"
        )
        
        let news3 = News(
            id: 2,
            image: "profile-news-1",
            category: "Altcoin news",
            date: "6 min ago",
            text: "Six XRP Token Holders to Speak in Ripple-SEC Case as Circle Gets Subpoena"
        )
        
        let news4 = News(
            id: 3,
            image: "profile-news-2",
            category: "Bitcoin news",
            date: "6 min ago",
            text: "Bitcoin Eyes Key Upside Break, Outperforms Ethereum, DOGE Rallies"
        )
        
        return [news1, news2, news3, news4]
    }
}

//
//  Coin.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import Foundation

struct Coin: Codable, Identifiable {
    let id: String
    let symbol: String
    let name: String
    let image: ImageAsset
    let marketData: MarketData
    
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case image
        case marketData = "market_data"
    }
    
    struct ImageAsset: Codable {
        let thumb: String
        let small: String
        let large: String
    }
    
    struct MarketData: Codable {
        let currentPrice: CurrentPrice
        let priceChange24h: Double
        let priceChange24hPercentage: Double
        
        enum CodingKeys: String, CodingKey {
            case currentPrice = "current_price"
            case priceChange24h = "price_change_24h"
            case priceChange24hPercentage = "price_change_percentage_24h"
        }
        
        struct CurrentPrice: Codable {
            let usd: Double
        }
    }
}


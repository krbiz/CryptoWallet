//
//  MarketViewModel.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI
import Alamofire

class MarketViewModel: ObservableObject {
    
    @Published var coins: [Coin] = []
    @Published var isFetched: Bool = false
    
    func fetchData() {
        AF.request("https://api.coingecko.com/api/v3/coins").responseDecodable(of: [Coin].self) { response in
            defer {
                self.isFetched = true
            }
            guard let coins = response.value else { return }
            self.coins = coins
        }
    }
    
}

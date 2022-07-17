//
//  ProfileViewModel.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI
import Alamofire

class ProfileViewModel: ObservableObject {
    
    @Published var news: [News] = []
    @Published var coins: [Coin] = []
    @Published var isFetchedTrending: Bool = false
    
    func fetchData() {
        news = News.generateFakeData()
        
        AF.request("https://api.coingecko.com/api/v3/coins").responseDecodable(of: [Coin].self) { response in
            guard let coins = response.value else { return }
            self.coins = coins
            self.isFetchedTrending = true
        }
    }
    
}

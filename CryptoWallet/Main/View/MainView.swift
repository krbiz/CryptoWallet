//
//  MainView.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI

struct MainView: View {
    @State var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            ProfileView()
                .tabItem {
                    Image(selection == 0 ? "tabbar-profile-fill" : "tabbar-profile")
                }
                .tag(0)
            
            MarketView()
                .tabItem {
                    Image(selection == 1 ? "tabbar-market-fill" : "tabbar-market")
                }
                .tag(1)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

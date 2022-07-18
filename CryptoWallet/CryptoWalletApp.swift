//
//  CryptoWalletApp.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI

@main
struct CryptoWalletApp: App {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    
    init() {
        setGlobalAppearance()
    }
    
    var body: some Scene {
        WindowGroup {
            if isFirstLaunch {
                OnboardingView()
            } else {
                MainView()
            }
        }
    }
    
    private func setGlobalAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "darkBlue")
        UITabBar.appearance().standardAppearance = appearance
        
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        
        let image = UIImage(named: "navbar-back")?
            .withAlignmentRectInsets(UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 12))
            .withRenderingMode(.alwaysOriginal)
        
        UINavigationBar.appearance().backIndicatorImage = image
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = image
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().shadowImage = UIImage()
        
        UITextField.appearance().keyboardAppearance = UIKeyboardAppearance.dark
    }
}

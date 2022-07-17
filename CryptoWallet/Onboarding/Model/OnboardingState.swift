//
//  OnboardingState.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import Foundation

enum OnboardingState: Int, CaseIterable, Identifiable {

    case first
    case second
    case third
    
    var title: String {
        switch self {
        case .first: return "Easiness"
        case .second: return "Security"
        case .third: return "Transformation"
        }
    }
    
    var description: String {
        switch self {
        case .first: return "Supplying the convenient transactions chains"
        case .second: return "Providing crypto audience with high-tech security solutions"
        case .third: return "Diversifying crypto investment experience worldwide"
        }
    }
    
    var image: String {
        switch self {
        case .first: return "onboarding-easiness"
        case .second: return "onboarding-security"
        case .third: return "onboarding-transformation"
        }
    }
    
    var id: Int { self.rawValue }
    
}

//
//  OnboardingView.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @State var currentState: OnboardingState = .first
    
    var body: some View {
        ScrollView([], showsIndicators: false) {
            HStack(alignment: .bottom, spacing: 0) {
                ForEach(OnboardingState.allCases) { state in
                    VStack(spacing: 0) {
                        Spacer()
                        
                        VStack(spacing: 0) {
                            Image(state.image)
                                .padding(.bottom, 72)
                            
                            VStack(spacing: 0) {
                                Text(state.title)
                                    .font(.system(size: 32, weight: .semibold))
                                    .foregroundColor(.custom(.white))
                                    .padding(.top, 42)
                                
                                Text(state.description)
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.custom(.gray))
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 20)
                                    .padding(.top, 16)
                                    .lineSpacing(3)
                                
                                Button {
                                    clickedContinue()
                                } label: {
                                    Text("Continue")
                                }
                                .buttonStyle(PinkButtonStyle())
                                .padding(.top, 24)
                                .padding(.bottom, 42)
                                .padding(.horizontal, 20)
                            }
                            .frame(maxWidth: .infinity)
                            .background(
                                Color.custom(.darkBlue)
                            )
                            .cornerRadius(30)
                        }
                    }
                    .padding(.horizontal, 20)
                    .frame(width: UIScreen.main.bounds.width)
                }
            }
            .offset(x: CGFloat(-currentState.rawValue) * UIScreen.main.bounds.width)
            .animation(.default, value: currentState)
            .padding(.bottom, 43)
        }
        .background(
            Color.custom(.black)
                .ignoresSafeArea()
        )
    }
    
    private func clickedContinue() {
        switch currentState {
        case .first:
            currentState = .second
        case .second:
            currentState = .third
        case .third:
            isFirstLaunch = false
        }
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

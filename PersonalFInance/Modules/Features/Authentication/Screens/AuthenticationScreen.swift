//
//  AuthenticationScreen.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 03/03/25.
//

import SwiftUI

struct AuthenticationScreen: View {
    @EnvironmentObject var authModel: AuthenticationModel
    @EnvironmentObject var loadingManager: LoadingManager
    
    @State private var showSignUp: Bool
    
    init(initialView: String) {
        _showSignUp = State(initialValue: initialView == "signup")
    }
    
    var body: some View {
        VStack {
            // titulo
            HStack() {
            }
            .frame(maxWidth: .infinity)
            .background(DesignSystem.Colors.grey900)
            
            VStack(alignment: .center) {
                Image("Logo")
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom)
            .background(RoundedCorner(radius: 8, corners: [.bottomLeft, .bottomRight]).fill(DesignSystem.Colors.grey900))
            
            Spacer()
            
            GeometryReader { geometry in
                ScrollView(.vertical) {
                    VStack {
                        if showSignUp {
                            SignUpView(showSignUp: $showSignUp)
                        } else {
                            LoginView(showSignUp: $showSignUp)
                                .transition(.fadeInOutSequential)
                        }
                    }
                    .frame(minHeight: geometry.size.height)
                }
            }

            
            Spacer()
        }
        .background(DesignSystem.Colors.beige100)
        .withLoading()
        .dismissKeyboardOnTap()
    }
}

#Preview {
    AuthenticationScreen(initialView: "singup")
        .environmentObject(AuthenticationModel())
        .environmentObject(LoadingManager())
}

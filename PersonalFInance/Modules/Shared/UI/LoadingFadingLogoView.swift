//
//  FLogoLoadingView.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 03/03/25.
//

import SwiftUI

struct LoadingFadingLogoView: View {
    @State private var isAnimating = false
    
    var body: some View {
        Image("Logo")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .foregroundColor(DesignSystem.Colors.grey900)
            .opacity(isAnimating ? 1 : 0.5)
            .animation(
                Animation.easeInOut(duration: 1)
                    .repeatForever(autoreverses: true),
                value: isAnimating
            )
            .onAppear {
                isAnimating = true
            }
    }
}

#Preview {
    LoadingFadingLogoView()
}

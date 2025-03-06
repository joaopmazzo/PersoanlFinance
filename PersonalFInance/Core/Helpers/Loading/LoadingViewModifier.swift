//
//  LoadingViewModifier.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 03/03/25.
//

import SwiftUI

struct LoadingViewModifier: ViewModifier {
    @EnvironmentObject var loadingManager: LoadingManager
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if loadingManager.isLoading {
                Color.black.opacity(0.3).edgesIgnoringSafeArea(.all)
                LoadingFadingLogoView()
            }
        }
    }
}

extension View {
    func withLoading() -> some View {
        self.modifier(LoadingViewModifier())
    }
}


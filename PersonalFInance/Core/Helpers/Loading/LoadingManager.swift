//
//  LoadingManager.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 03/03/25.
//

import Foundation

class LoadingManager: ObservableObject {
    @Published var isLoading: Bool = false
    
    func startLoading() {
        self.isLoading = true
    }
    
    func stopLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isLoading = false
        }
    }
}

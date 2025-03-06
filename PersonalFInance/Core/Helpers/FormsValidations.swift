//
//  FormsValidations.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 03/03/25.
//

import Foundation

class FormsValidations: ObservableObject {
    @Published var isEmailValid: Bool = false
    @Published var isPasswordValid: Bool = false
    
    private func isValidEmail(_ email: String) {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        self.isEmailValid = emailPredicate.evaluate(with: email)
    }
    
    private func isValidPassword(_ password: String) {
        let passwordRegex = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        
        self.isPasswordValid = passwordPredicate.evaluate(with: password)
    }
    
}

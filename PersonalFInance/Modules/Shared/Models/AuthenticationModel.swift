//
//  AuthenticationModel.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 03/03/25.
//

import Foundation
import SwiftUICore

class AuthenticationModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var hasCreatedAccount: Bool = false
    
    private var token: String?
    
    func tryRestoreAuthentication() {
        if let _ = token {
            print("Autenticação restaurada com sucesso.")
            isAuthenticated = true
        } else {
            print("Nenhum token de autenticação encontrado.")
        }
    }
    
    func createAccount(appState: AppState) {
        if !hasCreatedAccount {
            appState.hasCreatedAccount = true
            print("Conta criada com sucesso.")
        } else {
            print("A conta já existe.")
        }
    }
    
    func login(email: String, password: String) {
        isAuthenticated = true
        token = "token_exemplo_12345"
        print("Login bem-sucedido. Token gerado.")
    }
    
    func logout() {
        if isAuthenticated {
            isAuthenticated = false
            token = nil
            print("Logout bem-sucedido. Token removido.")
        } else {
            print("O usuário não está logado.")
        }
    }
}

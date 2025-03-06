//
// SingUpView.swift
// PersonalFInance
//
// Created by João Paulo Mazzo on 01/03/25.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var authModel: AuthenticationModel
    @EnvironmentObject var loadingManager: LoadingManager
    
    @Binding var showSignUp: Bool
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Sing Up")
                .font(DesignSystem.Typography.textPreset1)
                .bold()
                .foregroundColor(DesignSystem.Colors.grey900)
            
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading) {
                    Text("Name")
                        .font(DesignSystem.Typography.textPreset5Bold)
                        .foregroundColor(DesignSystem.Colors.grey500)
                    TextField("", text: $name)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 8).stroke(DesignSystem.Colors.beige500, lineWidth: 1))
                }
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(DesignSystem.Typography.textPreset5Bold)
                        .foregroundColor(DesignSystem.Colors.grey500)
                    TextField("", text: $email)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 8).stroke(DesignSystem.Colors.beige500, lineWidth: 1))
                }
                
                VStack(alignment: .leading) {
                    Text("Create Password")
                        .font(DesignSystem.Typography.textPreset5Bold)
                        .foregroundColor(DesignSystem.Colors.grey500)
                    HStack {
                        if isPasswordVisible {
                            TextField("", text: $password)
                        } else {
                            SecureField("", text: $password)
                        }
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(DesignSystem.Colors.grey900)
                        }
                    }
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(DesignSystem.Colors.beige500, lineWidth: 1))
                    Text("Passwords must be at least 8 characters")
                        .font(DesignSystem.Typography.textPreset5)
                        .foregroundColor(DesignSystem.Colors.grey500)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            
            Button(action: {
                authModel.createAccount(appState: appState)
            }) {
                Text("Create Account")
                    .font(DesignSystem.Typography.textPreset4Bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(DesignSystem.Colors.grey900)
                    .cornerRadius(8)
            }
            // Link para criar conta
            HStack(alignment: .center) {
                Text("Already have an account?")
                    .font(DesignSystem.Typography.textPreset4)
                    .foregroundColor(DesignSystem.Colors.grey500)
                Button("Login") {
                    showSignUp = false
                }
                .font(DesignSystem.Typography.textPreset4Bold)
                .foregroundColor(DesignSystem.Colors.grey900)
                .underline(true)
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(.white))
        .padding()
        .transition(.fadeInOutSequential)
    }
}

#Preview {
    @Previewable @State var showSignUp: Bool = true
    
    SignUpView(showSignUp: $showSignUp)
        .environmentObject(LoadingManager())
}

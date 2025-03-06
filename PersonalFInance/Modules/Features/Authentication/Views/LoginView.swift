//
// LoginView.swift
// PersonalFInance
//
// Created by João Paulo Mazzo on 01/03/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authModel: AuthenticationModel
    @EnvironmentObject var loadingManager: LoadingManager
    
    @Binding var showSignUp: Bool
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Login")
                .font(DesignSystem.Typography.textPreset1)
                .foregroundColor(DesignSystem.Colors.grey900)
            
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(DesignSystem.Typography.textPreset5Bold)
                        .foregroundColor(DesignSystem.Colors.grey500)
                    TextField("", text: $email)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 8).stroke(DesignSystem.Colors.beige500, lineWidth: 1))
                        .foregroundColor(DesignSystem.Colors.grey900)
                }
                
                VStack(alignment: .leading) {
                    Text("Password")
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
                }
            }
            
            Button(action: {authModel.login(email: email, password: password)}) {
                Text("Login")
                    .font(DesignSystem.Typography.textPreset4Bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(DesignSystem.Colors.grey900)
                    .cornerRadius(8)
            }
            
            HStack(alignment: .center) {
                Text("Need to create an account?")
                    .font(DesignSystem.Typography.textPreset4)
                    .foregroundColor(DesignSystem.Colors.grey500)
                Button("Sign Up") {
                        showSignUp = true
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
    @Previewable @State var showSignUp: Bool = false
    
    LoginView(showSignUp: $showSignUp)
        .environmentObject(LoadingManager())
}

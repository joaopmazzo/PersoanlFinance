//
//  KeyboardManager.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 04/03/25.
//

import SwiftUI
import Combine

/// Classe responsável por gerenciar os eventos do teclado e disponibilizar sua altura de forma reativa.
final class KeyboardManager: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Observador para quando o teclado aparece
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .sink { [weak self] notification in
                guard let self = self,
                      let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
                      let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
                      let window = windowScene.windows.first
                else { return }
                
                let safeAreaBottom = window.safeAreaInsets.bottom
                self.keyboardHeight = keyboardFrame.height - safeAreaBottom
            }
            .store(in: &cancellables)
        
        // Observador para quando o teclado some
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .sink { [weak self] _ in
                self?.keyboardHeight = 0
            }
            .store(in: &cancellables)
    }
}

/// Extensões para facilitar o gerenciamento do teclado em qualquer View.
extension View {
    /// Oculta o teclado enviando a ação resignFirstResponder para todos os responders.
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil,
                                        from: nil,
                                        for: nil)
    }
    
    /// Adiciona um gesto de toque que dispensa o teclado ao clicar fora dos campos de entrada.
    func dismissKeyboardOnTap() -> some View {
        self
            .contentShape(Rectangle()) // Garante que áreas "vazias" também respondam ao toque
            .onTapGesture {
                self.hideKeyboard()
            }
    }
}

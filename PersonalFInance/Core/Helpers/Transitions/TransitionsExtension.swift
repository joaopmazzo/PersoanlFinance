//
//  TransitionsExtension.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 04/03/25.
//

import SwiftUICore

extension AnyTransition {
    static var fadeInOutSequential: AnyTransition {
        // A view removida faz fade out em 0.5 segundos
        let removal = AnyTransition.opacity.animation(.easeInOut(duration: 0.3))
        // A view que entra fará fade in em 0.5 segundos, mas só iniciará após um delay de 0.5 segundos
        let insertion = AnyTransition.opacity.animation(Animation.easeInOut(duration: 0.3).delay(0.3))
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

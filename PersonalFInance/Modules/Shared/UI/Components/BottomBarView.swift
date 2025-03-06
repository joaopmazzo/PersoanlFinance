//
//  BottomBarView.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 02/03/25.
//

import SwiftUI

struct BottomBarView: View {
    @State private var selectedTab: Tab = .home
    @Namespace private var animationNamespace // Namespace para animações
    
    var body: some View {
        VStack {
            // Conteúdo principal baseado na aba selecionada
            ZStack {
                ForEach(Tab.allCases, id: \.self) { tab in
                    if selectedTab == tab {
                        tab.contentView
                            .transition(.move(edge: tab.transitionEdge)) // Transição personalizada
                            .animation(.easeInOut(duration: 0.3), value: selectedTab)
                    }
                }
            }
            
            // Barra inferior personalizada
            HStack(spacing: 40) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Button(action: {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                            selectedTab = tab
                        }
                    }) {
                        ZStack {
                            if selectedTab == tab {
                                RoundedCorner(radius: 8, corners: [.bottomLeft, .bottomRight])
                                    .fill(DesignSystem.Colors.beige100) // Fundo bege para ícone ativo
                                    .matchedGeometryEffect(id: "background", in: animationNamespace)
                                    .frame(height: 44)
                            }
                            
                            VStack(spacing: 4) {
                                Image(systemName: tab.iconName)
                                    .font(.system(size: 24))
                                    .foregroundColor(selectedTab == tab ? .teal : DesignSystem.Colors.grey300)
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            //            .padding(.top)
            .background(DesignSystem.Colors.grey900)
            
            HStack() {
            }
            .frame(maxWidth: .infinity)
            .background(DesignSystem.Colors.grey900)
        }
        .background(DesignSystem.Colors.beige100)
    }
}

enum Tab: CaseIterable {
    case home, transferencias, analise, financeiro, recibos
    
    var iconName: String {
        switch self {
        case .home: return "house.fill"
        case .transferencias: return "arrow.up.arrow.down"
        case .analise: return "chart.pie.fill"
        case .financeiro: return "dollarsign.circle.fill"
        case .recibos: return "list.bullet.rectangle"
        }
    }
    
    var contentView: some View {
        switch self {
        case .home:
            return AnyView(HomeScreen())
        case .transferencias:
            return AnyView(Text("Transferências").font(.largeTitle))
        case .analise:
            return AnyView(Text("Análise").font(.largeTitle))
        case .financeiro:
            return AnyView(Text("Financeiro").font(.largeTitle))
        case .recibos:
            return AnyView(Text("Recibos").font(.largeTitle))
        }
    }
    
    var transitionEdge: Edge {
        switch self {
        case .home, .transferencias, .analise:
            return .leading
        case .financeiro, .recibos:
            return .trailing
        }
    }
}

#Preview {
    BottomBarView()
}

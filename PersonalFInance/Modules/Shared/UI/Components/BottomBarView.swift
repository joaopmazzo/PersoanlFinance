//
//  BottomBarView.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 02/03/25.
//

import SwiftUI

struct BottomBarView: View {
    @State private var currentTab: Tab = .home
    @State private var offset: CGFloat = 0
    @Namespace private var animationNamespace
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                // Content with slide animation
                TabView(selection: $currentTab) {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        tab.contentView
                            .tag(tab)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .animation(.easeInOut, value: currentTab)
                
                // Custom bottom bar
                HStack(spacing: 40) {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        Button(action: {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                                currentTab = tab
                            }
                        }) {
                            ZStack {
                                if currentTab == tab {
//                                    RoundedCorner(radius: 8, corners: [.topRight])
//                                        .fill(DesignSystem.Colors.grey900)
//                                        .matchedGeometryEffect(id: "background_left_grey_bar", in: animationNamespace)
//                                        .frame(width: geometry.size.width / CGFloat(Tab.allCases.count) - 10, height: 5)
//                                        .offset(x: -geometry.size.width / CGFloat(Tab.allCases.count) + 10, y: -26)
//                                        .opacity(1)
//                                    RoundedCorner(radius: 8, corners: [.topLeft])
//                                        .fill(DesignSystem.Colors.grey900)
//                                        .matchedGeometryEffect(id: "background_right_grey_bar", in: animationNamespace)
//                                        .frame(width: geometry.size.width / CGFloat(Tab.allCases.count) - 10, height: 5)
//                                        .offset(x: geometry.size.width / CGFloat(Tab.allCases.count) - 10, y: -26)
//                                        .opacity(1)
                                    
                                    RoundedCorner(radius: 8, corners: [.bottomLeft, .bottomRight])
                                        .fill(DesignSystem.Colors.beige100)
                                        .matchedGeometryEffect(id: "background", in: animationNamespace)
                                        .frame(width: geometry.size.width / CGFloat(Tab.allCases.count) - 10, height: 50)
                                }
                                
                                VStack(spacing: 4) {
                                    ZStack {
//                                        if currentTab != tab {
//                                            Rectangle()
//                                                .fill(DesignSystem.Colors.grey900)
//                                                .frame(width: geometry.size.width / CGFloat(Tab.allCases.count) - 10, height: 5)
//                                                .offset(y: -26)
//                                        }
                                        
                                        Image(systemName: tab.iconName)
                                            .font(.system(size: 24))
                                            .foregroundColor(currentTab == tab ? .teal : DesignSystem.Colors.grey300)
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .background(DesignSystem.Colors.grey900)
            }
            .background(DesignSystem.Colors.beige100)
        }
    }
}


enum Tab: String, CaseIterable {
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
    
    var title: String {
        self.rawValue.capitalized
    }
    
    var contentView: some View {
        switch self {
        case .home:
            return HomeScreen()
        case .transferencias: 
            return TransactionsScreen()
        case .analise:
            return HomeScreen()
        case .financeiro:
            return HomeScreen()
        case .recibos:
            return HomeScreen()
//            return Text("Recibos Screen")
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .background(Color(hue: Double(Tab.allCases.firstIndex(of: self)!) / Double(Tab.allCases.count),
//                                  saturation: 0.2,
//                                  brightness: 0.9))
        }
    }
}

#Preview {
    BottomBarView()
}

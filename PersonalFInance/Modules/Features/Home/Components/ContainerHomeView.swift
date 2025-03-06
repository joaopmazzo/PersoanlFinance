//
//  SectionSlotHomeView.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 02/03/25.
//

import SwiftUI

struct ContainerHomeView<Destination: View, Content: View>: View {
    let title: String
    let forwardScreen: Destination
    let content: Content
    
    init(title: String,
         forwardScreen: Destination,
         @ViewBuilder content: () -> Content) {
        self.title = title
        self.forwardScreen = forwardScreen
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(title)
                    .font(DesignSystem.Typography.textPreset2)
                    .foregroundColor(DesignSystem.Colors.grey900)
                
                Spacer()
                
                NavigationLink(destination: forwardScreen.navigationBarBackButtonHidden(true)) {
                    Text("See Details")
                        .font(DesignSystem.Typography.textPreset4)
                        .foregroundColor(DesignSystem.Colors.grey500)
                    
                    Image(systemName: "arrowtriangle.forward.fill")
                        .resizable()
                        .frame(width: 5, height: 8)
                        .foregroundColor(DesignSystem.Colors.grey500)
                }
            }
            
            content
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(.white))
    }
}

#Preview {
    ContainerHomeView(
        title: "Sample Title",
        forwardScreen: EmptyView()
    ) {
        VStack(alignment: .leading, spacing: 10) {
            Text("This is the main content")
                .font(DesignSystem.Typography.textPreset3)
            Text("You can add more views here")
                .font(DesignSystem.Typography.textPreset4)
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
        }
    }
}

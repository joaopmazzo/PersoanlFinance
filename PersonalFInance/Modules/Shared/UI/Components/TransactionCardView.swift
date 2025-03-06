//
//  TransactionCardView.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 02/03/25.
//

import SwiftUI

struct TransactionCardView: View {
    var body: some View {
        HStack {
            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(Color.brown)
                        .frame(width: 32, height: 32)
                    
                    Image(systemName: "fork.knife")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                        .foregroundColor(DesignSystem.Colors.beige100)
                }
                Text("Nome")
                    .font(DesignSystem.Typography.textPreset4Bold)
                    .foregroundColor(DesignSystem.Colors.grey900)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 8) {
                Text("-$55.80")
                    .font(DesignSystem.Typography.textPreset4Bold)
                    .foregroundColor(DesignSystem.Colors.grey900)
                Text("19 aug 2024")
                    .font(DesignSystem.Typography.textPreset5)
                    .foregroundColor(DesignSystem.Colors.grey500)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    TransactionCardView()
}

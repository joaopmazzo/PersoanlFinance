//
//  BalanceCardView.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 02/03/25.
//

import SwiftUI

enum BalanceCardStyle {
    case plain
    case withIcon(icon: String, color: Color)
    case withBar(color: Color)
}

struct BalanceCardView: View {
    let title: String
    let amount: String
    let backgroundColor: Color
    let titleTextColor: Color
    let amountTextColor: Color
    let style: BalanceCardStyle
    
    var body: some View {
        HStack {
            leadingElement
            
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(titleFont)
                    .foregroundColor(titleTextColor)
                Text(amount)
                    .font(amountFont)
                    .foregroundColor(amountTextColor)
            }
            .padding(textPadding)
            
            Spacer()
        }
        .background(RoundedRectangle(cornerRadius: 12).fill(backgroundColor))
    }
    
    @ViewBuilder
    private var leadingElement: some View {
        switch style {
        case .plain:
            EmptyView()
        case .withIcon(let icon, let color):
            Image(systemName: icon)
                .foregroundColor(color)
                .imageScale(.large)
                .padding(.leading)
        case .withBar(let color):
            Rectangle()
                .fill(color)
                .frame(width: 4, height: 43)
                .cornerRadius(8)
        }
    }
    
    private var titleFont: Font {
        switch style {
        case .withBar:
            return DesignSystem.Typography.textPreset5
        default:
            return DesignSystem.Typography.textPreset4
        }
    }
    
    private var amountFont: Font {
        switch style {
        case .withBar:
            return DesignSystem.Typography.textPreset4Bold
        default:
            return DesignSystem.Typography.textPreset1
        }
    }
    
    private var textPadding: EdgeInsets {
        switch style {
        case .withBar:
            return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        default:
            return EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        }
    }
}

#Preview {
    BalanceCardView(title: "Current Balance",
                    amount: "$4,836.00",
                    backgroundColor: .black,
                    titleTextColor: .white,
                    amountTextColor: .white,
                    style: .plain)
    
    BalanceCardView(title: "Total Saved",
                    amount: "$850",
                    backgroundColor: DesignSystem.Colors.beige100,
                    titleTextColor: DesignSystem.Colors.grey500,
                    amountTextColor: DesignSystem.Colors.grey900,
                    style: .withIcon(icon: "wallet.bifold", color: DesignSystem.Colors.secondaryGreen))
    
    BalanceCardView(title: "Savings",
                    amount: "$159",
                    backgroundColor: .white,
                    titleTextColor: DesignSystem.Colors.grey500,
                    amountTextColor: DesignSystem.Colors.grey900,
                    style: .withBar(color: DesignSystem.Colors.secondaryGreen))
    
    BalanceCardView(title: "Savings",
                    amount: "$159",
                    backgroundColor: .white,
                    titleTextColor: DesignSystem.Colors.grey500,
                    amountTextColor: DesignSystem.Colors.grey900,
                    style: .withBar(color: DesignSystem.Colors.secondaryGreen))
}

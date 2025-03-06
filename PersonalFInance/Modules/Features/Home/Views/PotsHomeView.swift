//
//  PotsView.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 02/03/25.
//

import SwiftUI

struct PotsHomeView: View {
    var body: some View {
        ContainerHomeView(title: "Pots",
                          forwardScreen: HomeScreen()) {
            BalanceCardView(title: "Total Saved",
                            amount: "$850",
                            backgroundColor: DesignSystem.Colors.beige100,
                            titleTextColor: DesignSystem.Colors.grey500,
                            amountTextColor: DesignSystem.Colors.grey900,
                            style: .withIcon(icon: "wallet.bifold", color: DesignSystem.Colors.secondaryGreen))
            
            HStack {
                VStack(spacing: 16) {
                    BalanceCardView(title: "Savings",
                                    amount: "$159",
                                    backgroundColor: .white,
                                    titleTextColor: DesignSystem.Colors.grey500,
                                    amountTextColor: DesignSystem.Colors.grey900,
                                    style: .withBar(color: DesignSystem.Colors.secondaryGreen))
                    BalanceCardView(title: "Concert Ticket",
                                    amount: "$110",
                                    backgroundColor: .white,
                                    titleTextColor: DesignSystem.Colors.grey500,
                                    amountTextColor: DesignSystem.Colors.grey900,
                                    style: .withBar(color: DesignSystem.Colors.secondaryNavy))
                }
                
                Spacer()
                
                VStack(spacing: 16) {
                    BalanceCardView(title: "Gift",
                                    amount: "$159",
                                    backgroundColor: .white,
                                    titleTextColor: DesignSystem.Colors.grey500,
                                    amountTextColor: DesignSystem.Colors.grey900,
                                    style: .withBar(color: DesignSystem.Colors.secondaryCyan))
                    BalanceCardView(title: "New Laptop",
                                    amount: "$159",
                                    backgroundColor: .white,
                                    titleTextColor: DesignSystem.Colors.grey500,
                                    amountTextColor: DesignSystem.Colors.grey900,
                                    style: .withBar(color: DesignSystem.Colors.secondaryYellow))
                }
            }
        }
    }
}

#Preview {
    PotsHomeView()
}

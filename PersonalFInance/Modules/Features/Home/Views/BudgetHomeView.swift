//
//  BudgetHomeView.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 02/03/25.
//

import SwiftUI

struct BudgetHomeView: View {
    let categories = [
        Category(category: "Entertainment", totalSpent: 50.00, limit: 100.00, color: Color(hex: "#00A8E8")),
        Category(category: "Dining Out", totalSpent: 75.00, limit: 150.00, color: Color(hex: "#F4A261")),
        Category(category: "Personal Care", totalSpent: 100.00, limit: 200.00, color: Color(hex: "#6A4C93")),
        Category(category: "Bills", totalSpent: 750.00, limit: 525.00, color: Color(hex: "#2A9D8F"))
    ]
    
    var body: some View {
        ContainerHomeView(title: "Budgets",
                          forwardScreen: HomeScreen()) {
            
            DonutChartView(categories: categories)
            
            // Legendas personalizadas
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                ForEach(categories, id: \.category) { category in
                    BalanceCardView(title: category.category,
                                    amount: String(format: "%.2f", category.totalSpent),
                                    backgroundColor: .white,
                                    titleTextColor: DesignSystem.Colors.grey500,
                                    amountTextColor: DesignSystem.Colors.grey900,
                                    style: .withBar(color: category.color))
                }
            }
        }
    }
}

#Preview {
    BudgetHomeView()
}

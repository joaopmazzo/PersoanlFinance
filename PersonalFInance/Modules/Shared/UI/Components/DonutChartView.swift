//
//  DonutChartView.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 02/03/25.
//

import SwiftUI
import Charts

// Modelo para representar cada categoria
struct Category: Identifiable {
    let id = UUID()
    let category: String
    let totalSpent: Double
    let limit: Double
    let color: Color
}

struct DonutChartView: View {
    // Dados das categorias
    let categories: [Category]
    
    // Cálculo do total gasto e limite
    var totalSpent: Double {
        categories.reduce(0) { $0 + $1.totalSpent }
    }
    
    var totalLimit: Double {
        categories.reduce(0) { $0 + $1.limit }
    }
    
    var body: some View {
        VStack {
            ZStack {
                // Gráfico do tipo Donut (parte externa com cores fortes)
                Chart(categories, id: \.category) { category in
                    SectorMark(
                        angle: .value("Spent", category.totalSpent),
                        innerRadius: .ratio(0.75) // Define o "furo" do gráfico para torná-lo um donut
                    )
                    .foregroundStyle(Color(category.color)) // Aplica a cor personalizada
                }
                .frame(height: 300)
                
                // Gráfico do tipo Donut (parte interca com cores fracas)
                Chart(categories, id: \.category) { category in
                    SectorMark(
                        angle: .value("Spent", category.totalSpent),
                        innerRadius: .ratio(0.65) // Define o "furo" do gráfico para torná-lo um donut
                    )
                    .foregroundStyle(Color(category.color).opacity(0.5)) // Aplica a cor personalizada
                }
                .frame(height: 300)
                
                // Texto centralizado no gráfico
                VStack {
                    Text("$\(Int(totalSpent))")
                        .font(DesignSystem.Typography.textPreset1)
                        .foregroundColor(DesignSystem.Colors.grey900)
                    Text("of $\(Int(totalLimit)) limit")
                        .font(DesignSystem.Typography.textPreset5)
                        .foregroundColor(DesignSystem.Colors.grey500)
                }
            }
        }
        .padding()
    }
}

// Extensão para converter HEX em SwiftUI Color
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24 & 0xFF, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

#Preview {
    let categories = [
        Category(category: "Entertainment", totalSpent: 50.00, limit: 100.00, color: Color(hex: "#00A8E8")),
        Category(category: "Dining Out", totalSpent: 75.00, limit: 150.00, color: Color(hex: "#F4A261")),
        Category(category: "Personal Care", totalSpent: 100.00, limit: 200.00, color: Color(hex: "#6A4C93")),
        Category(category: "Bills", totalSpent: 750.00, limit: 525.00, color: Color(hex: "#2A9D8F"))
    ]
    
    DonutChartView(categories: categories)
}

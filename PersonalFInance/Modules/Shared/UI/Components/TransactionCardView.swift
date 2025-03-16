//
//  TransactionCardView.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 02/03/25.
//

import SwiftUI

// Modelo para representar cada categoria
struct Transaction: Identifiable {
    let id = UUID()
    let title: String
    let amount: Float
    let date: String
    let category: String?
}

struct TransactionCardView: View {
    let transactionData: Transaction
    let isDetailed: Bool
    
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
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(transactionData.title)
                        .font(DesignSystem.Typography.textPreset4Bold)
                        .foregroundColor(DesignSystem.Colors.grey900)
                    
                    if isDetailed, let category = transactionData.category{
                        Text(category)
                            .font(DesignSystem.Typography.textPreset5)
                            .foregroundColor(DesignSystem.Colors.grey500)
                    }
                }
            }
        
            Spacer()
            
            VStack(alignment: .trailing, spacing: 8) {
                Text(formatFloatToCurrency(transactionData.amount))
                    .font(DesignSystem.Typography.textPreset4Bold)
                    .foregroundColor(DesignSystem.Colors.grey900)
                Text(formatDate(transactionData.date))
                    .font(DesignSystem.Typography.textPreset5)
                    .foregroundColor(DesignSystem.Colors.grey500)
            }
        }
        .padding(.horizontal)
    }
}

/**
 Formats a float value into a currency string.
 
 - Parameters:
    - valor: The float value to be formatted.
 
 - Returns:
    A string representing the float value in currency format with two decimal places.
    If formatting fails, returns "--".
 
 - Overview:
    This function is used to convert a float value into a currency string, which can be used for display purposes.
 
 - Example:
    ```
    let valorFloat: Float = 10.99
    let valorFormatado = formatFloatToCurrency(valorFloat)
    print(valorFormatado) // Prints something like "$10.99"
    ```
 */
func formatFloatToCurrency(_ valor: Float) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 2
    
    return formatter.string(from: NSNumber(value: valor)) ?? "--"
}

/**
  Converts a date string from "yyyy-MM-dd" format to "dd MMM yyyy" format.
 
  - Parameters:
    - date: The date string in "yyyy-MM-dd" format.
 
  - Returns:
    A string representing the date in "dd MMM yyyy" format.
    If conversion fails, returns "--".
 
  - Overview:
    This function is used to convert a date string from a standard ISO format to a more readable format.
 
  - Example:
    ```
    let dataOriginal = "2025-03-14"
    let dataFormatada = formatDate(dataOriginal)
    print(dataFormatada) // Prints "14 Mar 2025"
    ```
 */
func formatDate(_ date: String) -> String {
    // Format that will recieve
    let formatoOriginal = DateFormatter()
    formatoOriginal.dateFormat = "yyyy-MM-dd"
    
    // Convert the string to Date object
    if let data = formatoOriginal.date(from: date) {
        // Format desired
        let formatoDesejado = DateFormatter()
        formatoDesejado.dateFormat = "dd MMM yyyy"
        
        // Formating the date
        let dataFormatada = formatoDesejado.string(from: data)
        
        return dataFormatada
    }
    
    return "--"
}

#Preview {
    let transaction = Transaction(title: "Padaria", amount: -12.50, date: "2025-03-14", category: "Alimentacao")
    
    TransactionCardView(transactionData: transaction, isDetailed: false)
    Divider().padding(.vertical, 12)
    TransactionCardView(transactionData: transaction, isDetailed: true)
}

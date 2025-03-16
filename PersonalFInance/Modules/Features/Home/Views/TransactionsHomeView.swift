//
//  TransactionsHomeView.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 02/03/25.
//

import SwiftUI

struct TransactionsHomeView: View {
    let transactionsMocks = [
        Transaction(title: "Padaria", amount: -12.50, date: "2025-03-14", category: "Alimentacao"),
        Transaction(title: "Mercado", amount: -12.50, date: "2025-03-14", category: "Mercado"),
        Transaction(title: "Posto de Combustivel", amount: -12.50, date: "2025-03-14", category: "Transporte"),
        Transaction(title: "Padaria", amount: -12.50, date: "2025-03-14", category: "Alimentacao")
    ]
    
    var body: some View {
        ContainerHomeView(title: "Transaction",
                          forwardScreen: HomeScreen()) {
            
            ForEach(transactionsMocks.indices, id: \.self) { index in
                TransactionCardView(transactionData: transactionsMocks[index], isDetailed: false)
                
                if index < transactionsMocks.count - 1 {
                    Divider().padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    TransactionsHomeView()
}

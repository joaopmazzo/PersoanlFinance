//
//  TransactionsHomeView.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 02/03/25.
//

import SwiftUI

struct TransactionsHomeView: View {
    var body: some View {
        ContainerHomeView(title: "Transaction",
                          forwardScreen: HomeScreen()) {
            
            TransactionCardView()
            Divider()
            TransactionCardView()
            Divider()
            TransactionCardView()
            Divider()
            TransactionCardView()
            Divider()
            TransactionCardView()
        }
    }
}

#Preview {
    TransactionsHomeView()
}

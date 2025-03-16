//
//  HomeView.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 01/03/25.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Overview")
                    .font(DesignSystem.Typography.textPreset1)
                    .bold()
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.leading)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    BalanceCardView(title: "Current Balance",
                                    amount: "$4,836.00",
                                    backgroundColor: .black,
                                    titleTextColor: .white,
                                    amountTextColor: .white,
                                    style: .plain)
                    BalanceCardView(title: "Income",
                                    amount: "$3,814.25",
                                    backgroundColor: .white,
                                    titleTextColor: DesignSystem.Colors.grey500,
                                    amountTextColor: DesignSystem.Colors.grey900,
                                    style: .plain)
                    BalanceCardView(title: "Expenses",
                                    amount: "$1,700.50",
                                    backgroundColor: .white,
                                    titleTextColor: DesignSystem.Colors.grey500,
                                    amountTextColor: DesignSystem.Colors.grey900,
                                    style: .plain)
                }
                .padding()
                
                PotsHomeView()
                    .padding()
                
                TransactionsHomeView()
                    .padding()
                
                BudgetHomeView()
                    .padding()
            }
            .frame(maxWidth: .infinity)
            
            Spacer()
            
            //                BottomBarView()
        }
        .background(DesignSystem.Colors.beige100)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

//VStack(alignment: .leading, spacing: 10) {
//                        Text("Current Balance")
//                            .font(.headline)
//                            .foregroundColor(.gray)
//                        Text("$4,836.00")
//                            .font(.largeTitle)
//                            .bold()
//
//                        HStack {
//                            VStack(alignment: .leading) {
//                                Text("Income")
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)
//                                Text("$3,814.25")
//                                    .font(.title3)
//                                    .bold()
//                            }
//                            Spacer()
//                            VStack(alignment: .leading) {
//                                Text("Expenses")
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)
//                                Text("$1,700.50")
//                                    .font(.title3)
//                                    .bold()
//                            }
//                        }
//                    }
//                    .padding()
//                    .background(.white)
//                    .cornerRadius(12)
//                    .shadow(radius: 5)

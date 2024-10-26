//
//  BudgetView.swift
//  EventWriter_Press
//
//  Created by Роман on 25.10.2024.
//

import SwiftUI

struct BudgetView: View {
    @StateObject var vm: BudgetViewModel
        
        var body: some View {
            ZStack {
                Color.main.ignoresSafeArea()
                VStack {
                    
                    //MARK: - Add Budget button
                    HStack{
                        Spacer()
                        NavigationLink {
                            if vm.switchBudget {
                                AddIncomeview(vm: vm)
                            }else{
                                AddExpensesview(vm: vm)
                            }
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 22, height: 22)
                        }
                        
                    }
                    
                    //MARK: - Title view
                    HStack{
                        Text("Budget")
                            .foregroundStyle(.white)
                            .font(.system(size: 34, weight: .heavy))
                        
                        Spacer()
                    }
                    
                    //MARK: - Switch button
                    HStack{
                        Button {vm.switchBudget = true} label: {
                            CustomButtonView(text: "Income", color: !vm.switchBudget ? .second : .orangeApp)
                        }
                        Button {vm.switchBudget = false} label: {
                            CustomButtonView(text: "Expenses", color: vm.switchBudget ? .second : .orangeApp)
                        }

                    }
                    
                    //MARK: - List budgets
                    ScrollView {
                        if vm.incomes.isEmpty && vm.switchBudget{
                            VStack {
                                Text("No incomes added")
                                    .foregroundStyle(.white)
                                Text("Add an income with the plus icon above")
                                    .foregroundStyle(.gray)
                                
                            }
                        }
                        if vm.expenses.isEmpty && !vm.switchBudget {
                            VStack {
                                Text("No expenses added")
                                    .foregroundStyle(.white)
                                Text("Add an expense with the plus icon above")
                                    .foregroundStyle(.gray)
                                
                            }
                        }
                        LazyVGrid(columns: [GridItem(), GridItem()]) {
                            if vm.switchBudget {
                               
                                ForEach(vm.incomes) { income in
                                    IncomeCellView(vm: vm, income: income)
                                }
                            }else {
                                
                                ForEach(vm.expenses) { expense in ExpensesCellView(vm: vm, expenses: expense)
                                }
                            }
                        }
                        
                    }
                    
                    Spacer()
                }.padding()
            }
    }
}

#Preview {
    BudgetView(vm: BudgetViewModel())
}

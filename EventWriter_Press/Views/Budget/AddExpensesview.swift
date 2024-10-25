//
//  AddExpensesview.swift
//  EventWriter_Press
//
//  Created by Роман on 25.10.2024.
//

import SwiftUI

struct AddExpensesview: View {
    @StateObject var vm: BudgetViewModel
    @FocusState var keyboard: Bool
    @Environment(\.dismiss) var dismiss
        
        var body: some View {
            ZStack {
                Color.main.ignoresSafeArea()
                VStack(spacing: 20){
                    //MARK: - Title view
                    HStack{
                        Text("New expenses")
                            .foregroundStyle(.white)
                            .font(.system(size: 34, weight: .heavy))
                        
                        Spacer()
                    }
                    
                    //MARK: - Title
                    TextField("Title", text: $vm.simpleExpensesTitle)
                        .frame(height: 62)
                        .focused($keyboard)
                        .padding(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(vm.simpleExpensesTitle.isEmpty ? .gray : .orangeApp, lineWidth: 2.0)
                        }
                    
                    HStack{
                        //MARK: - Date
                        DatePicker("Date", selection: $vm.simpleExpensesDate, displayedComponents: .date)
                            .frame(height: 62)
                            .padding(8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.orangeApp, lineWidth: 2.0)
                            }
                        
                        //MARK: - Sum
                        TextField("Sum", text: $vm.simpleExpensesSum)
                            .frame(height: 62)
                            .focused($keyboard)
                            .keyboardType(.numberPad)
                            .padding(8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(vm.simpleExpensesSum.isEmpty ? .gray : .orangeApp, lineWidth: 2.0)
                            }
                    }
                    Spacer()
                    
                    //MARK: - Add button
                    Button {
                        vm.addExpenses()
                        dismiss()
                    } label: {
                        CustomButtonView(text: "Add")
                            .opacity(vm.simpleExpensesTitle.isEmpty ? 0.5 : 1)
                    }
                    .disabled(vm.simpleExpensesTitle.isEmpty ? true : false)

                }
                .colorScheme(.dark)
                .padding()
            }
            .onTapGesture {
                keyboard = false
            }
    }
}

#Preview {
    AddExpensesview(vm: BudgetViewModel())
}

//
//  AddIncomeview.swift
//  EventWriter_Press
//
//  Created by Роман on 25.10.2024.
//

import SwiftUI

struct AddIncomeview: View {
    @StateObject var vm: BudgetViewModel
    @FocusState var keyboard: Bool
    @Environment(\.dismiss) var dismiss
        
        var body: some View {
            ZStack {
                Color.main.ignoresSafeArea()
                VStack(spacing: 20){
                    //MARK: - Title view
                    HStack{
                        Text("New Income")
                            .foregroundStyle(.white)
                            .font(.system(size: 34, weight: .heavy))
                        
                        Spacer()
                    }
                    
                    //MARK: - Title
                    TextField("Title", text: $vm.simpleIncomeTitle)
                        .frame(height: 62)
                        .focused($keyboard)
                        .padding(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(vm.simpleIncomeTitle.isEmpty ? .gray : .orangeApp, lineWidth: 2.0)
                        }
                    
                    HStack{
                        //MARK: - Date
                        DatePicker("Date", selection: $vm.simpleIncomeDate, displayedComponents: .date)
                            .frame(height: 62)
                            .padding(8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.orangeApp, lineWidth: 2.0)
                            }
                        
                        //MARK: - Sum
                        TextField("Sum", text: $vm.simpleIncomeSum)
                            .frame(height: 62)
                            .focused($keyboard)
                            .keyboardType(.numberPad)
                            .padding(8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(vm.simpleIncomeSum.isEmpty ? .gray : .orangeApp, lineWidth: 2.0)
                            }
                    }
                    Spacer()
                    
                    //MARK: - Add button
                    Button {
                        vm.addIncome()
                        dismiss()
                    } label: {
                        CustomButtonView(text: "Add")
                            .opacity(vm.simpleIncomeTitle.isEmpty ? 0.5 : 1)
                    }
                    .disabled(vm.simpleIncomeTitle.isEmpty ? true : false)
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
    AddIncomeview(vm: BudgetViewModel())
}

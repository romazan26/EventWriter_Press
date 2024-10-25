//
//  ExpensesCellView.swift
//  EventWriter_Press
//
//  Created by Роман on 25.10.2024.
//

import SwiftUI

struct ExpensesCellView: View {
    
    @StateObject var vm: BudgetViewModel
    let expenses: Expenses
    var body: some View {
        ZStack {
            Color.second.cornerRadius(30)
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    //MARK: Date
                    Text(Dateformatter(date: expenses.date ?? Date()))
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    //MARK: Delete buttom
                    Button {vm.deleteExpenses(expenses)} label: {
                        Image(systemName: "trash")
                    }
                }
                
                //MARK: title
                Text(expenses.title ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 16, weight: .bold))
                Spacer()
                
                //MARK: - Sum
                Text("+\(expenses.sum)")
                    .foregroundStyle(.red)
                    .minimumScaleFactor(0.5)
                    .font(.system(size: 34, weight: .bold))
            }.padding()
        }
        .frame(width: 171, height: 192)
    }
    //MARK: - Dateformatter
    private func Dateformatter(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.M.yyyy"
        return dateFormatter.string(from: date)
    }
}


//#Preview {
//    ExpensesCellView()
//}

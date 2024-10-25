//
//  IncomeCellView.swift
//  EventWriter_Press
//
//  Created by Роман on 25.10.2024.
//

import SwiftUI

struct IncomeCellView: View {
    @StateObject var vm: BudgetViewModel
    let income: Income
    var body: some View {
        ZStack {
            Color.second.cornerRadius(30)
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    //MARK: Date
                    Text(Dateformatter(date: income.date ?? Date()))
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    //MARK: Delete buttom
                    Button {vm.deleteIncome(income)} label: {
                        Image(systemName: "trash")
                    }
                }
                
                //MARK: title
                Text(income.title ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 16, weight: .bold))
                Spacer()
                
                //MARK: - Sum
                Text("+\(income.sum)")
                    .foregroundStyle(.green)
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

#Preview {
    IncomeCellView(vm: BudgetViewModel(), income: Income())
}

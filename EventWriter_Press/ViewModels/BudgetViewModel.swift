//
//  BudgetViewModel.swift
//  EventWriter_Press
//
//  Created by Роман on 25.10.2024.
//

import Foundation
import CoreData

final class BudgetViewModel: ObservableObject {
    @Published var expenses: [Expenses] = []
    @Published var incomes: [Income] = []
    
    let manager = CoreDataManager.instance
    
    @Published var switchBudget: Bool = true
    
    @Published var simpleIncomeTitle: String = ""
    @Published var simpleExpensesTitle: String = ""
    @Published var simpleIncomeSum: String = ""
    @Published var simpleExpensesSum: String = ""
    @Published var simpleIncomeDate: Date = Date()
    @Published var simpleExpensesDate: Date = Date()
    
    init() {
        fetchExpenses()
        fetchIncome()
    }
    
    func resetData() {

        for income in incomes {
            manager.context.delete(income)
        }
        for exercises in expenses {
            manager.context.delete(exercises)
        }
        saveBudget()
    }
    
    //MARK: - Delete data
    func deleteExpenses(_ expenses: Expenses){
        manager.context.delete(expenses)
        saveBudget()
    
    }
    
    func deleteIncome(_ income: Income){
        manager.context.delete(income)
        saveBudget()
    }
    
    //MARK: - Add data
    func addExpenses(){
        let newExpenses = Expenses(context: manager.context)
        newExpenses.title = simpleExpensesTitle
        newExpenses.sum = Int64(simpleExpensesSum) ?? 0
        newExpenses.date = simpleExpensesDate
        saveBudget()
        clearData()
    }
    
    func addIncome(){
        let newIncome = Income(context: manager.context)
        newIncome.title = simpleIncomeTitle
        newIncome.sum = Int64(simpleIncomeSum) ?? 0
        newIncome.date = simpleIncomeDate
        saveBudget()
        clearData()
    }
    
    //MARK: - Clear data
    func clearData(){
        simpleIncomeTitle = ""
        simpleExpensesTitle = ""
        simpleIncomeSum = ""
        simpleExpensesSum = ""
        simpleIncomeDate = Date()
        simpleExpensesDate = Date()
        
    }
    
    //MARK: - Save data
    func saveBudget(){
        expenses.removeAll()
        incomes.removeAll()
        manager.save()
        fetchExpenses()
        fetchIncome()
    }
    
    //MARK: - Get data
    func fetchExpenses() {
        let request = NSFetchRequest<Expenses>(entityName: "Expenses")
        do{
            expenses = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching articles: \(error)")
        }
    }
    
    func fetchIncome() {
        let request = NSFetchRequest<Income>(entityName: "Income")
        do{
            incomes = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching articles: \(error)")
        }
    }
}

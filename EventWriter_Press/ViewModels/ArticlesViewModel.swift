//
//  ArticlesViewModel.swift
//  EventWriter_Press
//
//  Created by Роман on 22.10.2024.
//

import Foundation
import CoreData

final class ArticlesViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    
    @Published var articles: [Article] = []
    @Published var simpleTitle: String = ""
    @Published var simpleText: String = ""
    @Published var simpleGenre: String = ""
    @Published var simpleStatus: String = ""
    @Published var simplePublisher: String = ""
    
    init() {
        fetchArticles()
    }
    
    func resetData() {
        for article in articles {
            manager.context.delete(article)
        }
        saveArticle()
    }
    
    
    //MARK: - Delete data
    func deleteArticle(article: Article) {
        manager.context.delete(article)
        saveArticle()
    }
    
    //MARK: - Add data
    func addArticle(){
        let newArticle = Article(context: manager.context)
        newArticle.title = simpleTitle
        newArticle.text = simpleText
        newArticle.genre = simpleGenre
        newArticle.status = simpleStatus
        newArticle.publisher = simplePublisher
        saveArticle()
        clearData()
    }
    
    //MARK: - Clear data
    func clearData(){
        simpleTitle = ""
        simpleText = ""
        simpleGenre = ""
        simpleStatus = ""
        simplePublisher = ""
    }
    
    //MARK: - Save data
    func saveArticle(){
        articles.removeAll()
        manager.save()
        fetchArticles()
    }
    
    //MARK: - Get data
    func fetchArticles() {
        let request = NSFetchRequest<Article>(entityName: "Article")
        do{
            articles = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching articles: \(error)")
        }
    }
}

//
//  PostViewModel.swift
//  EventWriter_Press
//
//  Created by Роман on 26.10.2024.
//

import CoreData
import Foundation

final class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    let manager = CoreDataManager.instance
    
    @Published var simpleName: String = ""
    @Published var simpleText: String = ""
    
    init() {
        fetchPosts()
    }
    
    func resetData() {

        for post in posts {
            manager.context.delete(post)
        }
        savePost()
    }
    
    //MARK: - Delete data
    func deletePost(_ post: Post){
        manager.context.delete(post)
        savePost()
    
    }
    
    //MARK: - Add data
    func addPost(){
        let newPost = Post(context: manager.context)
        newPost.namePost = simpleName
        newPost.textPost = simpleText
        newPost.date = Date()
        savePost()
        clearData()
    }
    
    //MARK: - Clear data
    func clearData(){
        simpleName = ""
        simpleText = ""
    }
    
    //MARK: - Save data
    func savePost(){
        posts.removeAll()
        manager.save()
        fetchPosts()
    }
    
    //MARK: - Get data
    func fetchPosts() {
        let request = NSFetchRequest<Post>(entityName: "Post")
        do{
            posts = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching articles: \(error)")
        }
    }
}

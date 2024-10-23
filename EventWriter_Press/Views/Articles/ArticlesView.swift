//
//  ArticlesView.swift
//  EventWriter_Press
//
//  Created by Роман on 22.10.2024.
//

import SwiftUI

struct ArticlesView: View {
    
    @StateObject var vm = ArticlesViewModel()
    
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                
                //MARK: - Add Article button
                HStack{
                    Spacer()
                    NavigationLink {
                        AddArticleView(vm: vm)
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 22, height: 22)
                    }
                    
                }
                
                //MARK: - Title view
                HStack{
                    Text("Articles")
                        .foregroundStyle(.white)
                        .font(.system(size: 34, weight: .heavy))
                        
                    Spacer()
                }
                
                //MARK: - List Articles
                if vm.articles.isEmpty {
                    Spacer()
                    Text("No articles added")
                        .font(.title2)
                        .foregroundStyle(.white)
                    Text("Add an article with the plus icon above")
                        .foregroundStyle(.gray)
                }
                ScrollView {
                    ForEach(vm.articles) { article in
                        NavigationLink {
                            ArticleView(vm: vm, article: article)
                        } label: {
                            ArticleCellView(article: article)
                        }   
                    }
                }
                Spacer()
            }.padding()
        }
    }
}

#Preview {
    ArticlesView()
}

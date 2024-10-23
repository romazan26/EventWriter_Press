//
//  ArticleView.swift
//  EventWriter_Press
//
//  Created by Роман on 23.10.2024.
//

import SwiftUI

struct ArticleView: View {
    @StateObject var vm: ArticlesViewModel
    @Environment(\.dismiss) var dismiss
    let article: Article
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 10) {
                //MARK: - Title article
                Text(article.title ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 34, weight: .bold))
                HStack{
                    //MARK: - Status
                    Text(article.status ?? "")
                        .foregroundStyle(.white)
                    Spacer()
                    
                    //MARK: - Genre
                    Text(article.genre ?? "")
                        .foregroundStyle(.black)
                        .font(.system(size: 11))
                        .padding(5)
                        .background {
                            Color.orangeApp.cornerRadius(30)
                        }
                }
                
                //MARK: - Publisher
                Text(article.publisher ?? "")
                    .foregroundStyle(.gray)
                    
                
                //MARK: - Text
                Text(article.text ?? "")
                    .foregroundStyle(.white)
                    .padding(.top)
                Spacer()
                
                //MARK: - Delete button
                Button {
                    vm.deleteArticle(article: article)
                    dismiss()
                } label: {
                    CustomButtonView(text: "Delete")
                }

            }.padding()
        }
    }
}

#Preview {
    ArticleView(vm: ArticlesViewModel(), article: Article())
}

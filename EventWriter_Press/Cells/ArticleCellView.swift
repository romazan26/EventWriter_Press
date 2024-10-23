//
//  ArticleCellView.swift
//  EventWriter_Press
//
//  Created by Роман on 23.10.2024.
//

import SwiftUI

struct ArticleCellView: View {
    let article: Article
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.second.cornerRadius(30)
            VStack(alignment: .leading) {
                Text(article.genre ?? "")
                    .foregroundStyle(.black)
                    .font(.system(size: 11))
                    .padding(5)
                    .background {
                        Color.orangeApp.cornerRadius(30)
                    }
                Text(article.title ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 22))
            }.padding()
        }.frame(height: 122)
    }
}

#Preview {
    ArticleCellView(article: Article())
}

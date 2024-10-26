//
//  PostView.swift
//  EventWriter_Press
//
//  Created by Роман on 26.10.2024.
//

import SwiftUI

struct PostView: View {
    let post: Post
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                //MARK: - Date of post
                Text(Dateformatter(date: post.date ?? Date()))
                    .foregroundStyle(.gray)
                
                //MARK: - Name post
                Text(post.namePost ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 22, weight: .bold))
                
                //MARK: - text post
                Text(post.textPost ?? "")
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.leading)
                    
                Spacer()
                
            }.padding()
        }
    }
    //MARK: - Dateformatter
    private func Dateformatter(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.M.yyyy"
        return dateFormatter.string(from: date)
    }
}



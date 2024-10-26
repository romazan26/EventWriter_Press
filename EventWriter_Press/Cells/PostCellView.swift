//
//  PostCellView.swift
//  EventWriter_Press
//
//  Created by Роман on 26.10.2024.
//

import SwiftUI

struct PostCellView: View {
    @StateObject var vm: PostViewModel
    let post: Post
    var body: some View {
        ZStack {
            Color.second.cornerRadius(30)
            VStack(alignment: .leading){
                HStack {
                    Text(Dateformatter(date: post.date ?? Date()))
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    //MARK: Delete buttom
                    Button {vm.deletePost(post)} label: {
                        Image(systemName: "trash")
                            .foregroundStyle(.gray)
                    }
                }
                Text(post.namePost ?? "")
                    .foregroundStyle(.white)
            }
            .padding()
        }
        .frame( height: 98)
        .frame(maxWidth: .infinity)
    }
    //MARK: - Dateformatter
    private func Dateformatter(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.M.yyyy"
        return dateFormatter.string(from: date)
    }
}

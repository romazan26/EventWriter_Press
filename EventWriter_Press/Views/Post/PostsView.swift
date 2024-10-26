//
//  PostsView.swift
//  EventWriter_Press
//
//  Created by Роман on 26.10.2024.
//

import SwiftUI

struct PostsView: View {
    @StateObject var vm: PostViewModel
        
        var body: some View {
            ZStack {
                Color.main.ignoresSafeArea()
                VStack {  
                    //MARK: - Add Post button
                    HStack{
                        Spacer()
                        NavigationLink {
                            AddPostView(vm: vm)
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 22, height: 22)
                        }
                        
                    }
                    
                    //MARK: - Title view
                    HStack{
                        Text("Posts")
                            .foregroundStyle(.white)
                            .font(.system(size: 34, weight: .heavy))
                            
                        Spacer()
                    }
                    
                    //MARK: - List Posts
                    if vm.posts.isEmpty {
                        Spacer()
                        Text("No posts added")
                            .font(.title2)
                            .foregroundStyle(.white)
                        Text("Add an posts with the plus icon above")
                            .foregroundStyle(.gray)
                    }
                    ScrollView {
                        ForEach(vm.posts) { post in
                            NavigationLink {
                                PostView(post: post)
                            } label: {
                                PostCellView(vm: vm, post: post)
                            }
                        }
                    }
                    Spacer()
                }.padding()
            }
        }
}

#Preview {
    PostsView(vm: PostViewModel())
}

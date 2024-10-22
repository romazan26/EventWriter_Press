//
//  AddArticleView.swift
//  EventWriter_Press
//
//  Created by Роман on 22.10.2024.
//

import SwiftUI

struct AddArticleView: View {
    @StateObject var vm: ArticlesViewModel
    @FocusState var keyboard: Bool
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            //MARK: - Backgroung
            Color.main.ignoresSafeArea()
            
            VStack(spacing: 20) {
                //MARK: - title view
                HStack{
                    Text("New Article")
                        .foregroundStyle(.white)
                        .font(.system(size: 34, weight: .heavy))
                        
                    Spacer()
                }
                TextField("Headline", text: $vm.simpleTitle)
                    .frame(height: 62)
                    .padding(8)
                    .focused($keyboard)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(vm.simpleTitle.isEmpty ? .gray : .orangeApp, lineWidth: 2.0)
                    }
                
                //MARK: - Genre list
                    ScrollView(.horizontal) {
                        HStack{
                        ForEach(GenreEnum.allCases, id: \.self) { genre in
                            Text(genre.rawValue)
                                .onTapGesture {
                                    vm.simpleGenre = genre.rawValue
                                }
                                .padding(8)
                                .background {
                                    Color.orangeApp.cornerRadius(20)
                                        
                                }
                                .opacity(vm.simpleGenre == genre.rawValue ? 1 : 0.4)
                        }
                    }
                }
                
                //MARK: - Publisher
                TextField("Publisher", text: $vm.simplePublisher)
                    .frame(height: 62)
                    .focused($keyboard)
                    .padding(8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(vm.simpleTitle.isEmpty ? .gray : .orangeApp, lineWidth: 2.0)
                    }
                
                //MARK: - text
                TextField("Articles text", text: $vm.simpleText)
                    .frame(height: 62)
                    .focused($keyboard)
                    .padding(8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(vm.simpleTitle.isEmpty ? .gray : .orangeApp, lineWidth: 2.0)
                    }
                Spacer()
                
                //MARK: - Add button
                Button {
                    vm.addArticle()
                    dismiss()
                } label: {
                    CustomButtonView(text: "Add")
                        .disabled(vm.simpleTitle.isEmpty ? true : false)
                        .opacity(vm.simpleTitle.isEmpty ? 0.5 : 1)
                }

            }
            .padding()
            
        }
        .onTapGesture {
            keyboard = false
        }
        .colorScheme(.dark)
    }
}

#Preview {
    NavigationView{
        AddArticleView(vm: ArticlesViewModel())
    }
}

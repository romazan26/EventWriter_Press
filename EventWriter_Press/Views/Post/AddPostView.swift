//
//  AddPostView.swift
//  EventWriter_Press
//
//  Created by Роман on 26.10.2024.
//

import SwiftUI

struct AddPostView: View {
    @StateObject var vm: PostViewModel
    @FocusState var keyboard: Bool
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack(spacing: 20) {
                //MARK: - title view
                HStack{
                    Text("New Post")
                        .foregroundStyle(.white)
                        .font(.system(size: 34, weight: .heavy))
                    
                    Spacer()
                }
                
                //MARK: - Name post
                TextField("Name", text: $vm.simpleName)
                    .frame(height: 62)
                    .focused($keyboard)
                    .padding(8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(vm.simpleName.isEmpty ? .gray : .orangeApp, lineWidth: 2.0)
                    }
                
                //MARK: - Text post
                MultiLineTF(txt: $vm.simpleText, placehold: "Text")
                    .frame(maxHeight: .infinity)
                    .focused($keyboard)
                    .padding(8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(vm.simpleText.isEmpty ? .gray : .orangeApp, lineWidth: 2.0)
                    }
                
                //MARK: - Create button
                Button {
                    vm.addPost()
                    dismiss()
                } label: {
                    CustomButtonView(text: "Create")
                        .opacity(vm.simpleName.isEmpty ? 0.5 : 1)
                }
                .disabled(vm.simpleName.isEmpty ? true : false)
            }
            .colorScheme(.dark)
            .padding()
        }
    }
}

#Preview {
    AddPostView(vm: PostViewModel())
}

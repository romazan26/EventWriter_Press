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
                    Button {
                        ///Plus action
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
                ScrollView {
                    Text("Articles")
                }
                Spacer()
            }.padding()
        }
    }
}

#Preview {
    ArticlesView()
}

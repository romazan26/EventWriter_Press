//
//  SettingButtonView.swift
//  EventWriter_Press
//
//  Created by Роман on 26.10.2024.
//

import SwiftUI

struct SettingButtonView: View {
    var text: String
    var image: String
    var color = false
    var body: some View {
        ZStack {
            Color(!color ? .second : .red)
                .cornerRadius(30)
            VStack {
                Image(systemName: image)
                    .resizable()
                    .frame(width: 44, height: 44)
                    .foregroundStyle(.white)
                Text(text)
                    .foregroundStyle(.white)
            }.padding()
        }.frame(height: 111)
    }
}

#Preview {
    SettingButtonView(text: "Sghare up", image: "square.and.arrow.up")
}

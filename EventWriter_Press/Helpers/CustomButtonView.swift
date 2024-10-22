//
//  CustomButtonView.swift
//  EventWriter_Press
//
//  Created by Роман on 22.10.2024.
//

import SwiftUI

struct CustomButtonView: View {
    var text: String
    var body: some View {
        ZStack {
            Color.orangeApp.cornerRadius(20)
            Text(text)
                .foregroundStyle(.black)
                .font(.title2)
        }.frame(height: 62)
    }
}

#Preview {
    CustomButtonView(text: "Save")
}
//
//  TabItemView.swift
//  EventWriter_Press
//
//  Created by Роман on 22.10.2024.
//

import SwiftUI

struct TabItemView: View {
    var imageName: String
    var text: String
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(text)
                .padding(5)
        }
    }
}

#Preview {
    TabItemView(imageName: "doc.plaintext.fill", text: "Article")
}

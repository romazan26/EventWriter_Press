//
//  CustomProgressView.swift
//  EventWriter_Press
//
//  Created by Роман on 21.10.2024.
//

import SwiftUI

struct CustomProgressView: View {

    var progress: Int = 3
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.gray)
                .frame(width: 190, height: 6)
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.orangeApp)
                .frame(width: 1.9 * CGFloat(progress), height: 6)
        }
        .padding()
    }
}

#Preview {
    CustomProgressView()
}

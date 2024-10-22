//
//  PageIntroView.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import SwiftUI

struct PageIntroView: View {
    var page: PageIntro
    
    var body: some View {

        ZStack(alignment: .bottom) {
            VStack {
                Text(page.text)
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundColor(.white)
                    .padding(.top, 20)
                    
                Text(page.secondText)
                    .foregroundStyle(.gray)
                    .font(.system(size: 17))
                Spacer()
                
                Image(page.imageUrl)
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
        }
                        
 
    }
}


#Preview {
    ZStack {
        Color.black
        PageIntroView(page: PageIntro.samplePage)
    }
}

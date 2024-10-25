//
//  ScoreView.swift
//  EventWriter_Press
//
//  Created by Роман on 25.10.2024.
//

import SwiftUI

struct ScoreView: View {
    let event: Event
    var body: some View {
        ZStack {
            Color.score.cornerRadius(16)
            HStack(alignment: .top,spacing: 20) {
                VStack {
                    //MARK: Score 1
                    Text("\(event.score1)")
                        .foregroundStyle(.orangeApp)
                        .font(.system(size: 68, weight: .bold))
                    
                    //MARK: Name team 1
                    Text("\(event.team1 ?? "")")
                        .foregroundStyle(.white)
                        .font(.system(size: 17))
                }
                
                Text(":")
                    .foregroundStyle(.white)
                    .font(.system(size: 68, weight: .bold))
                
                VStack {
                    //MARK: Score 2
                    Text("\(event.score2)")
                        .foregroundStyle(.orangeApp)
                        .font(.system(size: 68, weight: .bold))
                    
                    //MARK: Name team 2
                    Text("\(event.team2 ?? "")")
                        .foregroundStyle(.white)
                        .font(.system(size: 17))
                }
                    
            }
        }.frame(width: 292, height: 143)
    }
}

//#Preview {
//    ScoreView()
//}

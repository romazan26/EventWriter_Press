//
//  EventCellView.swift
//  EventWriter_Press
//
//  Created by Роман on 25.10.2024.
//

import SwiftUI

struct EventCellView: View {
    let event: Event
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.second.cornerRadius(30)
            VStack(alignment: .leading) {
                HStack{
                    //MARK: - Date
                    Text(Dateformatter(date: event.date ?? Date()))
                        .foregroundStyle(.black)
                        .font(.system(size: 11))
                        .padding(5)
                        .background {
                            Color.orangeApp.cornerRadius(30)
                        }
                    Spacer()
                    
                    Text("\(event.genre ?? ""), \(event.subTitle ?? "")")
                        .foregroundStyle(.gray)
                }
                Text("\(event.team1 ?? "") VS \(event.team2 ?? "")")
                    .foregroundStyle(.white)
                    .font(.system(size: 22, weight: .bold))
            }
            .padding()
            .frame(height: 122)
        }
    }
    //MARK: - Dateformatter
    private func Dateformatter(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.M.yyyy"
        return dateFormatter.string(from: date)
    }

}

#Preview {
    EventCellView(event: Event())
}

//
//  EventView.swift
//  EventWriter_Press
//
//  Created by Роман on 25.10.2024.
//

import SwiftUI

struct EventView: View {
    @StateObject var vm: EventsViewModel
    @Environment(\.dismiss) var dismiss
    let event: Event
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                //MARK: - Title view
                HStack{
                    Text("\(event.team1 ?? "") VS \(event.team2 ?? "")")
                        .foregroundStyle(.white)
                        .font(.system(size: 34, weight: .heavy))
                        
                    Spacer()
                }
                
                //MARK: - Genre and subTitle and date
                HStack{
                    Text("\(event.genre ?? ""), \(event.subTitle ?? "")")
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    Text(Dateformatter(date: event.date ?? Date()))
                        .foregroundStyle(.black)
                        .font(.system(size: 11))
                        .padding(5)
                        .background {
                            Color.orangeApp.cornerRadius(30)
                        }
                }
                
                //MARK: - Score
                ScoreView(event: event)
                Spacer()
            }.padding()
                .toolbar {
                    ToolbarItem {
                        Button {
                            vm.deleteEvent(event: event)
                            dismiss()
                        } label: {
                            Image(systemName: "trash")
                        }

                    }
                }
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
    EventView(vm: EventsViewModel(), event: Event())
}

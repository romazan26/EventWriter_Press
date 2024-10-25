//
//  EventsView.swift
//  EventWriter_Press
//
//  Created by Роман on 25.10.2024.
//

import SwiftUI

struct EventsView: View {
    @StateObject var vm = EventsViewModel()
        
        var body: some View {
            ZStack {
                Color.main.ignoresSafeArea()
                VStack {
                    
                    //MARK: - Add Article button
                    HStack{
                        Spacer()
                        NavigationLink {
                            AddEventView(vm: vm)
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 22, height: 22)
                        }
                        
                    }
                    
                    //MARK: - Title view
                    HStack{
                        Text("Events")
                            .foregroundStyle(.white)
                            .font(.system(size: 34, weight: .heavy))
                            
                        Spacer()
                    }
                    
                    //MARK: - List Articles
                    if vm.events.isEmpty {
                        Spacer()
                        Text("No events added")
                            .font(.title2)
                            .foregroundStyle(.white)
                        Text("Add an events with the plus icon above")
                            .foregroundStyle(.gray)
                    }
                    ScrollView {
                        ForEach(vm.events) { event in
                            NavigationLink {
                                EventView(vm: vm, event: event)
                            } label: {
                                EventCellView(event: event)
                            }
                        }
                    }
                    Spacer()
                }.padding()
            }
        }
    
}

#Preview {
    EventsView()
}

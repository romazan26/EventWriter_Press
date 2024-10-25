//
//  AddEventView.swift
//  EventWriter_Press
//
//  Created by Роман on 25.10.2024.
//

import SwiftUI

struct AddEventView: View {
    
    @StateObject var vm: EventsViewModel
    @FocusState var keyboard: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack(spacing: 20) {
                //MARK: - title view
                HStack{
                    Text("New Event")
                        .foregroundStyle(.white)
                        .font(.system(size: 34, weight: .heavy))
                        
                    Spacer()
                }
                
                //MARK: - team 1
                HStack{
                    TextField("Team 01", text: $vm.simpleTeam1)
                        .frame(height: 62)
                        .focused($keyboard)
                        .padding(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(vm.simpleTeam1.isEmpty ? .gray : .orangeApp, lineWidth: 2.0)
                        }
                    TextField("Team score", text: $vm.simpleScore1)
                        .frame(height: 62)
                        .focused($keyboard)
                        .padding(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(vm.simpleScore1.isEmpty ? .gray : .orangeApp, lineWidth: 2.0)
                        }
                }
                .colorScheme(.dark)
                
                //MARK: - team 2
                HStack{
                    TextField("Team 02", text: $vm.simpleTeam2)
                        .frame(height: 62)
                        .focused($keyboard)
                        .padding(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(vm.simpleTeam2.isEmpty ? .gray : .orangeApp, lineWidth: 2.0)
                        }
                    TextField("Team score", text: $vm.simpleScore2)
                        .frame(height: 62)
                        .focused($keyboard)
                        .padding(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(vm.simpleScore2.isEmpty ? .gray : .orangeApp, lineWidth: 2.0)
                        }
                }
                .colorScheme(.dark)
                
                //MARK: - Genre list
                    ScrollView(.horizontal) {
                        HStack{
                        ForEach(GenreEnum.allCases, id: \.self) { genre in
                            Text(genre.rawValue)
                                .onTapGesture {
                                    vm.simpleGenre = genre.rawValue
                                }
                                .padding(8)
                                .background {
                                    Color.orangeApp.cornerRadius(20)
                                        
                                }
                                .opacity(vm.simpleGenre == genre.rawValue ? 1 : 0.4)
                        }
                    }
                }
                
                //MARK: - Subtitle
                TextField("SubTitle", text: $vm.simpleSubtitle)
                    .frame(height: 62)
                    .focused($keyboard)
                    .padding(8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(vm.simpleSubtitle.isEmpty ? .gray : .orangeApp, lineWidth: 2.0)
                    }
                    .colorScheme(.dark)
                
                //MARK: - Date
                DatePicker("Date", selection: $vm.simpleDate, displayedComponents: .date)
                    .frame(height: 62)
                    .padding(8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.orangeApp, lineWidth: 2.0)
                    }
                    .colorScheme(.dark)
                
                Spacer()
                if vm.simpleTeam1.isEmpty || vm.simpleTeam2.isEmpty {
                    Text("Please fill teams names")
                        .foregroundStyle(.white)
                }
                //MARK: - Add button
                Button {
                    vm.addEvent()
                    dismiss()
                } label: {
                    CustomButtonView(text: "Add")
                        
                        .opacity(vm.simpleTeam1.isEmpty || vm.simpleTeam2.isEmpty ? 0.5 : 1)
                }
                .disabled(vm.simpleTeam1.isEmpty || vm.simpleTeam2.isEmpty ? true : false)
                
            }.padding()
        }
        .onTapGesture {
            keyboard = false
        }
    }
}

#Preview {
    AddEventView(vm: EventsViewModel())
}

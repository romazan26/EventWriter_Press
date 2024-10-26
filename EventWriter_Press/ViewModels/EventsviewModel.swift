//
//  EventsviewModel.swift
//  EventWriter_Press
//
//  Created by Роман on 25.10.2024.
//

import CoreData
import Foundation

final class EventsViewModel: ObservableObject {
    @Published var events: [Event] = []
    
    let manager = CoreDataManager.instance
    
    @Published var simpleTeam1: String = ""
    @Published var simpleTeam2: String = ""
    @Published var simpleGenre: String = ""
    @Published var simpleScore1: String = ""
    @Published var simpleScore2: String = ""
    @Published var simpleSubtitle: String = ""
    @Published var simpleDate: Date = Date()
    
    init() {
        fetchEvents()
    }
    
    func resetData() {
        for event in events {
            manager.context.delete(event)
        }
        saveEvent()
    }
    
    //MARK: - Delete data
    func deleteEvent(event: Event) {
        manager.context.delete(event)
        saveEvent()
    }
    
    //MARK: - Add data
    func addEvent(){
        let newEvent = Event(context: manager.context)
        newEvent.team1 = simpleTeam1
        newEvent.team2 = simpleTeam2
        newEvent.score1 = Int16(simpleScore1) ?? 0
        newEvent.score2 = Int16(simpleScore2) ?? 0
        newEvent.genre = simpleGenre
        newEvent.subTitle = simpleSubtitle
        newEvent.date = simpleDate
        saveEvent()
        clearData()
    }
    
    //MARK: - Clear data
    func clearData(){
        simpleTeam1 = ""
        simpleTeam2 = ""
        simpleGenre = ""
        simpleScore1 = ""
        simpleScore2 = ""
        simpleSubtitle = ""
        simpleDate = Date()
    }
    
    //MARK: - Save data
    func saveEvent(){
        events.removeAll()
        manager.save()
        fetchEvents()
    }
    
    //MARK: - Get data
    func fetchEvents() {
        let request = NSFetchRequest<Event>(entityName: "Event")
        do{
            events = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching articles: \(error)")
        }
    }
    
}

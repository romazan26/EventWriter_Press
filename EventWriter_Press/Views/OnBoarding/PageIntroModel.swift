//
//  PageIntroModel.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import Foundation

struct PageIntro: Identifiable,Equatable {
    let id = UUID()
    var imageUrl: String
    var text: String
    var secondText: String
    var tag: Int

    static var samplePage = PageIntro(imageUrl: "intro1", text: "Be a better journalist", secondText: "Write articles", tag: 0)
    
    static var sampalePages: [PageIntro] = [
        PageIntro(imageUrl: "intro1", text: "Be a better journalist", secondText: "Write articles", tag: 0),
        PageIntro(imageUrl: "intro2", text: "Control the budget", secondText: "Where finances go", tag: 1),
        PageIntro(imageUrl: "intro3", text: "Smart notes", secondText: "Integrated notes to help you in the events", tag: 2)
    ]
}

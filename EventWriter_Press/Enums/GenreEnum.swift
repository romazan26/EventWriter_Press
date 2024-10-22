//
//  GenreEnum.swift
//  EventWriter_Press
//
//  Created by Роман on 22.10.2024.
//

import Foundation

enum GenreEnum: String, Codable, CaseIterable {
    case basketball = "Basketball"
    case football = "Football"
    case volleyball = "Volleyball"
    case hockey = "Hockey"
    case box = "Box"
    case golf = "Golf"
    case other = "Other"
}

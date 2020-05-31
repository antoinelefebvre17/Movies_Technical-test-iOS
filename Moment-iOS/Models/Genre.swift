//
//  Genre.swift
//  Moment-iOS
//
//  Created by Antoine Lefebvre on 31/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import Foundation

struct Genre: Codable, Identifiable {
    var id: Int
    var name: String
}

struct Genres: Codable {
    var genres: [Genre]
}

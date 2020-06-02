//
//  Genre.swift
//  Movies
//
//  Created by Antoine Lefebvre on 31/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import Foundation

class Genre: Codable, Identifiable {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    /// helpful for JSONDecoder
    required init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try keyedContainer.decode(Int.self, forKey: .id)
        self.name = try keyedContainer.decodeIfPresent(String.self, forKey: .name) ?? "No genre"
    }
}

class Genres: Codable {
    var genres: [Genre]
}

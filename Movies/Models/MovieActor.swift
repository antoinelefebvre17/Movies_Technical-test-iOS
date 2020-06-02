//
//  DetailMovie.swift
//  Movies
//
//  Created by Antoine Lefebvre on 01/06/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import Foundation

class MovieActor: Codable, Identifiable {
    var id: Int
    var name: String
    var profile_path: String
    
    init(id: Int, name: String, profile_path: String) {
        self.id = id
        self.name = name
        self.profile_path = profile_path
    }
    
    /// helpful for JSONDecoder
    required init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try keyedContainer.decode(Int.self, forKey: .id)
        self.name = try keyedContainer.decodeIfPresent(String.self, forKey: .name) ?? "No name"
        self.profile_path = try keyedContainer.decodeIfPresent(String.self, forKey: .profile_path) ?? ""
    }
}

class MovieCast: Codable {
    var cast: [MovieActor]
}

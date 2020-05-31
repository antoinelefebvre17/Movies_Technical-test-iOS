//
//  Movie.swift
//  Moment-iOS
//
//  Created by Antoine Lefebvre on 31/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import Foundation

class Movie: Codable, Identifiable { //Identifiable ? class ? //Codable
    var id: Int
    var popularity: Double
    var poster_path: String?
    var original_title: String
    var genre_ids: [Int]
    var overview: String
    var release_date: String
    
    init(id: Int, popularity: Double, poster_path: String?, original_title: String, genre_ids: [Int], overview: String, release_date: String) {
        self.id = id
        self.popularity = popularity
        self.poster_path = poster_path
        self.original_title = original_title
        self.genre_ids = genre_ids
        self.overview = overview
        self.release_date = release_date
    }
}

class Movies: Codable {
    var results: [Movie]
}


//
//  DetailMovie.swift
//  Moment-iOS
//
//  Created by Antoine Lefebvre on 01/06/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import Foundation

//class ProductionCountries: Codable {
//    var iso_3166_1: String = ""
//    var name: String = ""
//}
//
//class DetailMovie: Codable, Identifiable { //Identifiable ? class ? //Codable
//    var id: Int
//    var budget: Int
//    var overview: String
//    var production_countries: [ProductionCountries]
//    var release_date: String
//    var vote_average: Double
//
//    init(id: Int = 0, budget: Int = 0, overview: String = "", production_countries: [ProductionCountries] = [], release_date: String = "", vote_average: Double = 0.0) {
//        self.id = id
//        self.budget = budget
//        self.overview = overview
//        self.production_countries = production_countries
//        self.release_date = release_date
//        self.vote_average = vote_average
//    }
//}

class DetailMovieCast: Codable, Identifiable {
    var id: Int = 0
    var character: String = ""
    var name: String = ""
    var profile_path: String = ""
    
    required init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        id = try keyedContainer.decode(Int.self, forKey: .id)
        character = try keyedContainer.decode(String.self, forKey: .character)
        name = try keyedContainer.decode(String.self, forKey: .name)
        profile_path = try keyedContainer.decodeIfPresent(String.self, forKey: .profile_path) ?? ""
        
    }
}

class DetailMovieCasts: Codable {
    var cast: [DetailMovieCast]
}

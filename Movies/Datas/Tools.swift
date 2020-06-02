//
//  ManageData.swift
//  Movies
//
//  Created by Antoine Lefebvre on 31/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import Foundation

class Tools {
    let apiKeyTMDB = "cd827015dfa90cce9c7ef02bef8a254d" /// create TMDB API key: https://developers.themoviedb.org/3/getting-started/introduction
    let apiLanguageTMDB = "en-US" /// manage language TMDB API: https://developers.themoviedb.org/3/getting-started/languages
    
    public func parsJson<T: Decodable>(data:Data, test: T.Type) -> T? {
        var resultAPI: T
        do {
            resultAPI = try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Error parsing the JSON: \(error)")
            return nil
        }
        return resultAPI
    }
}

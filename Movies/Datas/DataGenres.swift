//
//  CallAPIGenres.swift
//  Movies
//
//  Created by Antoine Lefebvre on 31/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import Foundation

class DataGenres: ObservableObject {
    @Published var genres = [Genre]()
    
    init() {
        loadGenresFromAPI()
    }
    
    /// info TMDB API genres movies: https://developers.themoviedb.org/3/genres/get-movie-list
    func loadGenresFromAPI() {
        let urlTMDBP = "https://api.themoviedb.org/3/genre/movie/list?api_key=\(Tools().apiKeyTMDB)&language=\(Tools().apiLanguageTMDB)"
        let url = URL(string: urlTMDBP)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print ("no data")
                return
            }
            
            if let error = error {
                print(error)
                return
            }
            
            guard let parseGenres = Tools().parsJson(data: data, test: Genres.self) else {
                return
            }
            
            DispatchQueue.main.async {
                self.genres.append(contentsOf: parseGenres.genres)
            }
        }
        task.resume()
    }
}

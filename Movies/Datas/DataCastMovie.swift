//
//  DataDetailsMovie.swift
//  Movies
//
//  Created by Antoine Lefebvre on 01/06/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import Foundation

class DataCastMovie: ObservableObject {
    @Published var castMovie = [MovieActor]()
    
    init(idMovie: Int) {
        loadCastMoovieFromAPI(idMovie: idMovie)
    }
    
    /// info TMDB API credits movies: https://developers.themoviedb.org/3/movies/get-movie-credits
    func loadCastMoovieFromAPI(idMovie: Int) {
        let urlTMDBP = "https://api.themoviedb.org/3/movie/\(idMovie)/credits?api_key=\(Tools().apiKeyTMDB)"
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
            
            guard let parseCastMovie = Tools().parsJson(data: data, test: MovieCast.self) else {
                return
            }
            
            DispatchQueue.main.async {
                self.castMovie.append(contentsOf: parseCastMovie.cast)
            }
            
        }
        task.resume()
    }
}

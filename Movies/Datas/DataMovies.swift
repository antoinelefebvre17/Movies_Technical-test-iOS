//
//  CallAPI.swift
//  Movies
//
//  Created by Antoine Lefebvre on 30/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import Foundation
import UIKit

class DataMovies: ObservableObject, RandomAccessCollection {
    @Published var movies = [Movie]()
    
    var startIndex: Int { movies.startIndex }
    var endIndex: Int { movies.endIndex }
    
    var page = 1
    
    init(idGenre: String = "") {
        loadMooviesFromAPI(idGenre: idGenre)
    }
    
    subscript(position: Int) -> Movie {
        return movies[position]
    }
    
    /// info TMDB API popelar movies: https://developers.themoviedb.org/3/movies/get-popular-movies
    func loadMooviesFromAPI(idGenre: String = "") {
        let urlTMDB = "https://api.themoviedb.org/3/movie/popular?api_key=\(Tools().apiKeyTMDB)&language=\(Tools().apiLanguageTMDB)&page=\(page)&with_genres=\(idGenre)"
        let url = URL(string: urlTMDB)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print ("no data")
                return
            }
            
            if let error = error {
                print(error)
                return
            }
            
            guard let parseMovies = Tools().parsJson(data: data, test: Movies.self) else {
                return
            }
            
            DispatchQueue.main.async {
                self.movies.append(contentsOf: parseMovies.results)
            }
        }
        task.resume()
    }
    
    /// check if we need to load more movies
    func checkMoreMoviesToLoad(genreID: String = "", movie: Movie) {
        if (movie === self.movies[self.movies.endIndex - 1]) {
            self.page += 1
            loadMooviesFromAPI(idGenre: genreID)
        }
    }
    
}

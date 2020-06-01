//
//  CallAPI.swift
//  Moment-iOS
//
//  Created by Antoine Lefebvre on 30/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import Foundation
import UIKit

class DataMovies: ObservableObject, RandomAccessCollection { //manage Data + inout pour loadDataFromAPI ?
    @Published var movies = [Movie]()
    
    var startIndex: Int { movies.startIndex }
    var endIndex: Int { movies.endIndex }
    
    let urlTMDB = "https://api.themoviedb.org/3/movie/popular?api_key=cd827015dfa90cce9c7ef02bef8a254d&language=fr&page="
    var page = 1
    
    init() {
        loadMooviesFromAPI()
    }
    
    subscript(position: Int) -> Movie {
        return movies[position]
    }
    
    func loadMooviesFromAPI() { // export function content of return datatask
        let urlTMDBPage = "\(self.urlTMDB)\(page)"
        let url = URL(string: urlTMDBPage)!
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
    
    func checkMoreMoviesToLoad(movie: Movie) {
        if (movie === self.movies[self.movies.endIndex - 1]) {
            self.page += 1
            loadMooviesFromAPI()
        }
    }
    
}

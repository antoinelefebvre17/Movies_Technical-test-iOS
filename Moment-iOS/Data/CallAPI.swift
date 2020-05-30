//
//  CallAPI.swift
//  Moment-iOS
//
//  Created by Antoine Lefebvre on 30/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import Foundation
import UIKit

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

class MoviesResultAPI: Codable {
    var results: [Movie]
}

class MoviesFromAPI: ObservableObject, RandomAccessCollection {
    @Published var movies = [Movie]()
    
    var startIndex: Int { movies.startIndex }
    var endIndex: Int { movies.endIndex }
    
    let urlTMDB = "https://api.themoviedb.org/3/movie/popular?api_key=cd827015dfa90cce9c7ef02bef8a254d&language=fr&page="
    var page = 1
    
    init() {
        loadDataFromAPI()
    }
    
    subscript(position: Int) -> Movie {
        return movies[position]
    }
    
    func loadDataFromAPI() {
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
            let parseMovies = self.parseData(data: data)
            DispatchQueue.main.async {
                self.movies.append(contentsOf: parseMovies)
            }
        }
        task.resume()
    }
    
    func parseData(data:Data) -> [Movie] {
        var resultAPI: MoviesResultAPI
        do {
            resultAPI = try JSONDecoder().decode(MoviesResultAPI.self, from: data)
        } catch {
            print("Error parsing the JSON: \(error)")
            return []
        }
        
        return resultAPI.results
    }
    
    func checkMoreData(movie: Movie) {
        if (movie === self.movies[self.movies.endIndex - 1]) {
            self.page += 1
            loadDataFromAPI()
        }
    }
    
}

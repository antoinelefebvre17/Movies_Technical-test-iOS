//
//  CallAPI.swift
//  Moment-iOS
//
//  Created by Antoine Lefebvre on 30/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import Foundation

class Movie: Identifiable, Codable {
    var id: Int
    var popularity: Double
    var poster_path: String
    var original_title: String
    var genre_ids: [Int]
    var overview: String
    var release_date: String
}

class MoviesResultAPI: Codable {
    var results: [Movie]
}

class MoviesFromAPI: ObservableObject, RandomAccessCollection {
    @Published var movies = [Movie]()
    
    var startIndex: Int { movies.startIndex }
    var endIndex: Int { movies.endIndex }

    var urlTMDB = "https://api.themoviedb.org/3/movie/popular?api_key=cd827015dfa90cce9c7ef02bef8a254d&language=fr&page=1"

    init() {
        loadDataFromAPI()
    }
    
    subscript(position: Int) -> Movie {
        return movies[position]
    }
    
    func loadDataFromAPI() {
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
            let parseMovies = parseData(data: data)
            DispatchQueue.main.async {
                self.movies.append(contentsOf: parseMovies)
            }
            print(parseMovies)
        }
        task.resume()
    }
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

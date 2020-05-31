//
//  CallAPIGenres.swift
//  Moment-iOS
//
//  Created by Antoine Lefebvre on 31/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import Foundation

struct Genre: Codable, Identifiable {
    var id: Int
    var name: String
}

struct Genres: Codable {
    var genres: [Genre]
}

class CallAPIGenres {
    var genres = [Genre]()
    
    init() {
        loadDataFromAPI()
//        self.genres = [Genre]
    }
    
    func loadDataFromAPI() {
        let urlTMDBPage = "https://api.themoviedb.org/3/genre/movie/list?api_key=cd827015dfa90cce9c7ef02bef8a254d&language=fr"
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
//            print(parseMovies)
            DispatchQueue.main.async {
                self.genres.append(contentsOf: parseMovies)
            }
        }
        task.resume()
    }
    
    func parseData(data:Data) -> [Genre] {
        var resultAPI: Genres
        do {
            resultAPI = try JSONDecoder().decode(Genres.self, from: data)
        } catch {
            print("Error parsing the JSON: \(error)")
            return []
        }
        
        return resultAPI.genres
    }
    
    func returnNameGenres(id: Int) -> String {
        let indexFound = self.genres.firstIndex {
            $0.id == id
        }
        
        guard let index = indexFound else {
            return "Category no found"
        }
        return genres[index].name
    }
}

//
//  CallAPIGenres.swift
//  Moment-iOS
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
    
    func loadGenresFromAPI() {
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
            guard let parseGenres = Tools().parsJson(data: data, test: Genres.self) else {
                return
            }
            DispatchQueue.main.async {
                self.genres.append(contentsOf: parseGenres.genres)
            }
        }
        task.resume()
    }
    
    func returnNameGenreById(id: Int) -> String {
        let indexFound = self.genres.firstIndex {
            $0.id == id
        }
        
        guard let index = indexFound else {
            return "Category no found"
        }
        
        return genres[index].name
    }
}

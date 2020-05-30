//
//  MoviesList.swift
//  Moment-iOS
//
//  Created by Antoine Lefebvre on 30/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import SwiftUI

struct MoviesList: View {
    @ObservedObject var moviesTMDB = MoviesFromAPI()
    
    var body: some View {
        List(moviesTMDB) { (movies: Movie) in
            Text(movies.overview)
        }
    }
}

struct MoviesList_Previews: PreviewProvider {
    static var previews: some View {
        MoviesList()
    }
}

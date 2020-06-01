//
//  MoviesList.swift
//  Moment-iOS
//
//  Created by Antoine Lefebvre on 30/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import SwiftUI

struct MoviesList: View {
    @ObservedObject var movies: DataMovies
    
    init(genreID: String = "") {
        UITableView.appearance().separatorColor = .clear
        movies = DataMovies(genreID: genreID)
    }
    
    var body: some View {
        List {
            ForEach(movies) { (movie: Movie) in
                ZStack {
                    MoviesListItem(movie: movie)
                        .onAppear() {
                            self.movies.checkMoreMoviesToLoad(movie: movie)
                    }
                    NavigationLink(destination: MovieDetail(movie: movie)) {
                        EmptyView()
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
    
}

struct MoviesList_Previews: PreviewProvider {
    static var previews: some View {
        MoviesList()
    }
}

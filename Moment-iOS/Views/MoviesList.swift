//
//  MoviesList.swift
//  Moment-iOS
//
//  Created by Antoine Lefebvre on 30/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import SwiftUI

struct MoviesList: View {
    @ObservedObject var movies = DataMovies()
    let genres = DataGenres()
    
    init() {
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(movies) { (movie: Movie) in
                    ZStack {
                        MoviesListItem(movie: movie, genres: self.genres)
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
            .navigationBarTitle(Text("Moment"))
        }
    }
}

struct MoviesList_Previews: PreviewProvider {
    static var previews: some View {
        MoviesList()
    }
}

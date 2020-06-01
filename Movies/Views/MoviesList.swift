//
//  MoviesList.swift
//  Movies
//
//  Created by Antoine Lefebvre on 30/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import SwiftUI

struct MoviesList: View {
    @ObservedObject var dataMovies: DataMovies
    
    init(idGenre: String = "") {
        UITableView.appearance().separatorColor = .clear
        dataMovies = DataMovies(idGenre: idGenre)
    }
    
    var body: some View {
        List {
            ForEach(dataMovies) { (movie: Movie) in
                ZStack {
                    MovieItem(movie: movie)
                        .onAppear() {
                            self.dataMovies.checkMoreMoviesToLoad(movie: movie)
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

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
        NavigationView {
            List(moviesTMDB) { (movie: Movie) in
                NavigationLink(destination: MovieDetail(movie: movie)) {
                    Text(movie.original_title)
                }
                .onAppear() {
                    self.moviesTMDB.checkMoreData(movie: movie)
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

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
    
    init() {
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(moviesTMDB) { (movie: Movie) in
                    ZStack {
                        MoviesListItem(movie: movie)
                            .onAppear() {
                                self.moviesTMDB.checkMoreData(movie: movie)
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

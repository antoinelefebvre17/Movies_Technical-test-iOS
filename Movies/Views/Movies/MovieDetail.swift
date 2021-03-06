//
//  MovieDetail.swift
//  Movies
//
//  Created by Antoine Lefebvre on 30/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import SwiftUI

struct MovieDetail: View {
    @ObservedObject var dataCastMovie: DataCastMovie
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        self.dataCastMovie = DataCastMovie(idMovie: self.movie.id)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    MoviePoster(urlMoviePoster: movie.poster_path)
                        .cornerRadius(10)
                        .scaledToFit()
                        .frame(width: 250.0,height:250)
                        .shadow(radius: 10)
                    
                    Text(movie.original_title)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding([.leading, .bottom, .trailing])
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .multilineTextAlignment(.center)
                    
                    ActorsList(datilsMovie: dataCastMovie.castMovie)
                        .padding(.leading)
                }
                .padding([.top, .bottom])
                
                Divider()
                    .padding([.leading, .trailing])
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Overview")
                            .padding(.bottom)
                            .font(.title)
                        
                        Text(movie.overview)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding([.leading, .trailing])
                    
                    VStack(alignment: .leading) {
                        Text("Release date")
                            .padding(.bottom)
                            .font(.title)
                        
                        Text(movie.release_date)
                    }
                    .padding([.top, .leading, .trailing])
                }
                .padding(.bottom)
            }
        }
    }
    
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie(id: 419704, popularity: 100.0, poster_path: "cJ0wqaQ9KPzs3fROXUuaWgRg9Pj.jpg", original_title: "Ad Astra", genre_ids: [1, 2], overview: "Resume", release_date: "17/05/1998"))
    }
}

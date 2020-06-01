//
//  MovieDetail.swift
//  Moment-iOS
//
//  Created by Antoine Lefebvre on 30/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct MovieDetail: View {
    let movie: Movie
    @ObservedObject var movieDetail: DataDetailsMovie
    
    init(movie: Movie) {
        self.movie = movie
        self.movieDetail = DataDetailsMovie(id: self.movie.id)
    }
    
    var body: some View {
        ScrollView {
            
            VStack {
                
                KFImage(URL(string: "https://image.tmdb.org/t/p/w200/\(movie.poster_path ?? "test")")!) // a modifier
                    .resizable()
                    .cornerRadius(10)
                    .scaledToFit()
                    .frame(width: 250.0,height:250)
                    .shadow(radius: 10)
                    .padding(.top)
                
                Text(movie.original_title)
                    .padding()
                    .font(.system(size: 25, weight: .bold, design: .default))
                    .multilineTextAlignment(.center)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(self.movieDetail.detailsMovie) { detail in
                            VStack {
                                
                                KFImage(URL(string: "https://image.tmdb.org/t/p/w200/\(detail.profile_path)"))
                                    .placeholder {
                                        Image(systemName: "person.crop.circle")
                                            .frame(width: 100.0, height: 100.0)
                                            .font(.largeTitle)
                                            .opacity(0.3)
                                }
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .frame(width: 150.0, height: 150.0)
                                .shadow(radius: 10)
                                .padding(.bottom)
                                
                                Text("\(detail.name)")
                                    .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 50)
                                    .multilineTextAlignment(.center)
                            }
                            
                        }
                    }
                    .padding([.top, .bottom])
                    
                }
                
                Divider()
                    .padding([.leading, .trailing])
                
                VStack(alignment: .leading) {
                    Text("Resume")
                        .padding(.bottom)
                        .font(.title)
                    
                    Text(movie.overview)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()

                Spacer()
            }
        }
    }
    
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie(id: 419704, popularity: 100.0, poster_path: "cJ0wqaQ9KPzs3fROXUuaWgRg9Pj.jpg", original_title: "Ad Astrfztgzfdrtgzrdfsga", genre_ids: [1, 2], overview: "Resume", release_date: "17/05/1998"))
    }
}

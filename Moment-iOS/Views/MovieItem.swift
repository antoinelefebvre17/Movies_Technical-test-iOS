//
//  MoviesListItem.swift
//  Moment-iOS
//
//  Created by Antoine Lefebvre on 30/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct MovieItem: View {
    let movie: Movie
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                KFImage(URL(string: "https://image.tmdb.org/t/p/w200/\(movie.poster_path)"))
                    .placeholder {
                        Image(systemName: "tv")
                            .frame(width: 100.0, height: 100.0)
                            .font(.largeTitle)
                            .opacity(0.3)
                }
                .resizable()
                .cornerRadius(10)
                .scaledToFit()
                .frame(width: 100.0,height:100)
                .shadow(radius: 10)
                
                VStack(alignment: .leading) {
                    Text(movie.original_title)
                        .padding(.horizontal)
                        .font(.headline)
                    
                    Text("🔥 \(self.movie.popularity, specifier: "%.2f")")
                        .font(.system(size: 12, weight: .regular))
                        .lineLimit(2)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.green)
                        .cornerRadius(5)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                }
                .padding(.top)
                
                Spacer()
            }
        }
    }
}

struct MoviesListItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieItem(movie: Movie(id: 419704, popularity: 100.0, poster_path: "cJ0wqaQ9KPzs3fROXUuaWgRg9Pj.jpg", original_title: "Ad Astra", genre_ids: [1, 2], overview: "Resume", release_date: "17/05/1998"))
    }
}

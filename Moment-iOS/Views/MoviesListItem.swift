//
//  MoviesListItem.swift
//  Moment-iOS
//
//  Created by Antoine Lefebvre on 30/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct MoviesListItem: View {
    let movie: Movie
    let genres: CallAPIGenres

    var body: some View {
        HStack(spacing: 0) {
            KFImage(URL(string: "https://image.tmdb.org/t/p/w200/\(movie.poster_path ?? "test")")!) // a modifier
                .resizable()
                .cornerRadius(10)
                .scaledToFit()
                .frame(width: 100.0,height:100)
                .shadow(radius: 10)
            
            VStack(alignment: .leading) {
                Text(movie.original_title)
                    .padding(.horizontal)
                    .font(.headline)
                HStack {
                    ForEach(movie.genre_ids, id: \.self) { genres in
                        Text("\(self.genres.returnNameGenres(id: genres))")
                            .font(.system(size: 12, weight: .regular))
                            .lineLimit(2)
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.green)
                            .cornerRadius(5)
                    }
                }
                .onAppear(){
                    
                }
                .padding(.horizontal)
                Spacer()
                
            }
            .padding(.top)
            Spacer()
        }
    }
}

//struct MoviesListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        MoviesListItem(movie: Movie(id: 1, popularity: 100.0, poster_path: "cJ0wqaQ9KPzs3fROXUuaWgRg9Pj.jpg", original_title: "Ad Astrfztgzfdrtgzrdfsga", genre_ids: [1, 2], overview: "Resume", release_date: "17/05/1998"))
//    }
//}

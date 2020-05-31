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

    var body: some View {
        KFImage(URL(string: "https://image.tmdb.org/t/p/w200/\(movie.poster_path ?? "test")")!) // a modifier
            .resizable()
            .cornerRadius(10)
            .scaledToFit()
            .frame(width: 250.0,height:250)
            .shadow(radius: 10)
        //        Text(movie.original_title)
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie(id: 1, popularity: 100.0, poster_path: "cJ0wqaQ9KPzs3fROXUuaWgRg9Pj.jpg", original_title: "Ad Astrfztgzfdrtgzrdfsga", genre_ids: [1, 2], overview: "Resume", release_date: "17/05/1998"))
    }
}

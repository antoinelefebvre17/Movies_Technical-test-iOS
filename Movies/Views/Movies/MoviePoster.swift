//
//  MoviePoster.swift
//  Movies
//
//  Created by Antoine Lefebvre on 02/06/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct MoviePoster: View {
    let urlMoviePoster: String
    
    var body: some View {
        KFImage(URL(string: "https://image.tmdb.org/t/p/w200/\(urlMoviePoster )"))
            .placeholder {
                Image(systemName: "tv")
                    .frame(width: 100.0, height: 100.0)
                    .font(.largeTitle)
                    .opacity(0.3)
        }
        .resizable()
    }
}

struct MoviePoster_Previews: PreviewProvider {
    static var previews: some View {
        MoviePoster(urlMoviePoster: "cJ0wqaQ9KPzs3fROXUuaWgRg9Pj.jpg")
    }
}

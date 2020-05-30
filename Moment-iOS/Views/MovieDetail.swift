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
//        Text(movie.original_title)
    }
}

//struct MovieDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetail()
//    }
//}

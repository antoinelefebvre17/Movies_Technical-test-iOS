//
//  MoviesHome.swift
//  Moment-iOS
//
//  Created by Antoine Lefebvre on 01/06/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import SwiftUI

struct Home: View {
    @ObservedObject var genres: DataGenres
    
    init() {
        genres = DataGenres()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                GenresList(genres: self.genres.genres)
                    .padding([.top, .leading, .trailing])
                
                Divider()
                    .padding()
                
                MoviesList()
                    .navigationBarTitle(Text("Popular movies"))
            }
            
        }
    }
}

struct MoviesHome_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

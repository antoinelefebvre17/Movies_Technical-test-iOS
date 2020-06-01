//
//  GenresList.swift
//  Moment-iOS
//
//  Created by Antoine Lefebvre on 01/06/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import SwiftUI

struct GenresList: View {
    let genres: [Genre]
    
    var body: some View {
        VStack {
            if !self.genres.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        ForEach(self.genres) { genre in
                            NavigationLink(destination: {
                                MoviesList(idGenre: String(genre.id))
                                    .navigationBarTitle(Text(genre.name))
                            }()) {
                                Text("\(genre.name)")
                                    .padding(5)
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(5)
                            }
                        }
                    }
                }
            }
        }
    }
}


//struct GenresList_Previews: PreviewProvider {
//    static var previews: some View {
//        GenresList()
//    }
//}

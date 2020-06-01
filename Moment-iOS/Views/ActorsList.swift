//
//  CastsList.swift
//  Moment-iOS
//
//  Created by Antoine Lefebvre on 01/06/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct ActorsList: View {
    let castMovie: [MovieActor]
    
    init(datilsMovie: [MovieActor]) {
        self.castMovie = datilsMovie
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(self.castMovie) { detail in
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
                        .frame(width: 125.0, height: 150.0)
                        .shadow(radius: 10)
                        .padding([.top, .bottom])
                        
                        Text("\(detail.name)")
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
    }
}

struct CastsList_Previews: PreviewProvider {
    static var previews: some View {
        ActorsList(datilsMovie: [MovieActor(id: 1, name: "Brad Pitt", profile_path: "kU3B75TyRiCgE270EyZnHjfivoq.jpg"), MovieActor(id: 2, name: "Brad Pitt", profile_path: "kU3B75TyRiCgE270EyZnHjfivoq.jpg")])
    }
}

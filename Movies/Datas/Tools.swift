//
//  ManageData.swift
//  Movies
//
//  Created by Antoine Lefebvre on 31/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import Foundation

class Tools {
    public func parsJson<T: Decodable>(data:Data, test: T.Type) -> T? {
        var resultAPI: T
        do {
            resultAPI = try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Error parsing the JSON: \(error)")
            return nil
        }
        return resultAPI
    }
}

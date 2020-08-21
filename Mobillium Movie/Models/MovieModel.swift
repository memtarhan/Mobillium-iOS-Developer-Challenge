//
//  MovieModel.swift
//  Mobillium Movie
//
//  Created by Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var originalTitle: String
    var popularity: Double
    var voteCount: Int
}

struct Movies: Codable {
    var results: [Movie]
}

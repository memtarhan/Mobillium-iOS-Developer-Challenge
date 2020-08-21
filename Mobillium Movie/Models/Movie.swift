//
//  Movie.swift
//  Mobillium Movie
//
//  Created by Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var title: String
    var popularity: Double
    var releaseDate: String
    var posterPath: String
}

struct Movies: Codable {
    var results: [Movie]
}

extension String {
    var asReleaseDate: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        return formatter.date(from: self) ?? Date()
    }
}

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
    var id: Int
}

struct Movies: Codable {
    var results: [Movie]
}

struct MovieDetails: Codable {
    var title: String
    var overview: String
    var popularity: Double
    var releaseDate: String
    var posterPath: String
    var imdbId: String
}

extension String {
    var asReleaseDate: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        return formatter.date(from: self) ?? Date()
    }
}

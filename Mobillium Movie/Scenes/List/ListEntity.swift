//
//  ListEntity.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

struct ListEntity {
    struct ViewModel {
        var title: String
        let rateValue: CGFloat
        let ratePercentage: Int
        let rateColor: UIColor
        var releaseDate: String
        var imageUrl: String
        var id: String
    }
}

enum ListType {
    case upcoming, nowPlaying

    var title: String {
        switch self {
        case .upcoming: return "Upcoming"
        case .nowPlaying: return "Now playing"
        }
    }

    var apiPrefix: String {
        switch self {
        case .upcoming: return "\(prefix)/upcoming?"
        case .nowPlaying: return "\(prefix)/now_playing?"
        }
    }

    private var prefix: String {
        return "https://api.themoviedb.org/3/movie"
    }
}

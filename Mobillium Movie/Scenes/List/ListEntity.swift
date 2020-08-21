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
        var popularity: String
        var releaseDate: String
        var imageUrl: String
    }
}

enum ListType {
    case upcoming, nowPlaying
}

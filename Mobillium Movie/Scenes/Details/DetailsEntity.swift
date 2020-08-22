//
//  DetailsEntity.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

struct DetailsEntity {
    struct Response {
        let title: String
        let rateValue: CGFloat
        let ratePercentage: Int
        let rateColor: UIColor
        let overview: String
        let posterURL: String
        let imdbId: String
    }
}

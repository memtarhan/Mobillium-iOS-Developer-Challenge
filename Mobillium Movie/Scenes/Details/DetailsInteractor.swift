//
//  DetailsInteractor.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol DetailsInteractor: class {
}

class DetailsInteractorImpl: DetailsInteractor {
    
    private let service: DetailsService

    init(service: DetailsService) {
        self.service = service
    }
}

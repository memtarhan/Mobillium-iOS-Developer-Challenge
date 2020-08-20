//
//  SearchInteractor.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 20.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol SearchInteractor: class {
}

class SearchInteractorImpl: SearchInteractor {
    
    private let service: SearchService

    init(service: SearchService) {
        self.service = service
    }
}

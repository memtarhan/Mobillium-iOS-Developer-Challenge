//
//  ListInteractor.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol ListInteractor: class {
}

class ListInteractorImpl: ListInteractor {
    
    private let service: ListService

    init(service: ListService) {
        self.service = service
    }
}

//
//  SearchRouter.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 20.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol SearchRouter: class {
    var view: SearchViewController? { get set }
}

class SearchRouterImpl: SearchRouter {
    var view: SearchViewController?
    
    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }
}

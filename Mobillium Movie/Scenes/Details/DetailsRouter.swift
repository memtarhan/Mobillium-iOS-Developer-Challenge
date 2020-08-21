//
//  DetailsRouter.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol DetailsRouter: class {
    var view: DetailsViewController? { get set }
}

class DetailsRouterImpl: DetailsRouter {
    var view: DetailsViewController?
    
    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }
}

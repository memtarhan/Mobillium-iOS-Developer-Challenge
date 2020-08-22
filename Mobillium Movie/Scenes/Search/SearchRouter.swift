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
    
    func navigateToDetails(forMovie movie: String)
}

class SearchRouterImpl: SearchRouter {
    var view: SearchViewController?
    
    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }
    
    func navigateToDetails(forMovie movie: String) {
        let next = factory.details
        next.movieId = movie
        guard let nextViewController = next as? UIViewController,
            let sourceViewController = view as? UIViewController else { return }
        sourceViewController.present(nextViewController, animated: true, completion: nil)
    }
}

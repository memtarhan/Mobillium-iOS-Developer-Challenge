//
//  ListRouter.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol ListRouter: class {
    var view: ListViewController? { get set }

    func navigateToDetails(forMovie movie: String)
    func navigateToSearch()
}

class ListRouterImpl: ListRouter {
    var view: ListViewController?

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

    func navigateToSearch() {
        let next = factory.search
        guard let nextViewController = next as? UIViewController,
            let sourceViewController = view as? UIViewController else { return }
        sourceViewController.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

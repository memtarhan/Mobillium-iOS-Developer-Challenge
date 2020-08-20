//
//  SearchAssembly.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 20.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Swinject
import UIKit

class SearchAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SearchViewController.self) { r in
            let viewController = SearchViewControllerImpl(nibName: "SearchViewController", bundle: nil)
            let presenter = r.resolve(SearchPresenter.self)!
            let interactor = r.resolve(SearchInteractor.self)!
            let router = r.resolve(SearchRouter.self)!

            presenter.view = viewController
            presenter.router = router
            presenter.interactor = interactor
            viewController.presenter = presenter
            router.view = viewController

            return viewController
        }

        container.register(SearchPresenter.self) { _ in
            SearchPresenterImpl()
        }

        container.register(SearchInteractor.self) { r in
            SearchInteractorImpl(service: r.resolve(SearchService.self)!)
        }

        container.register(SearchRouter.self) { r in
            SearchRouterImpl(factory: r.resolve(ViewControllerFactory.self)!)
        }

        container.register(SearchService.self) { _ in
            SearchServiceImpl()
        }
    }
}

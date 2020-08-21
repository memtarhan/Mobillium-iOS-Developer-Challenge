//
//  DetailsAssembly.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Swinject
import UIKit

class DetailsAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DetailsViewController.self) { r in
            let viewController = DetailsViewControllerImpl(nibName: "DetailsViewController", bundle: nil)
            let presenter = r.resolve(DetailsPresenter.self)!
            let interactor = r.resolve(DetailsInteractor.self)!
            let router = r.resolve(DetailsRouter.self)!

            presenter.view = viewController
            presenter.router = router
            presenter.interactor = interactor
            viewController.presenter = presenter
            router.view = viewController

            return viewController
        }

        container.register(DetailsPresenter.self) { _ in
            DetailsPresenterImpl()
        }

        container.register(DetailsInteractor.self) { r in
            DetailsInteractorImpl(service: r.resolve(DetailsService.self)!)
        }

        container.register(DetailsRouter.self) { r in
            DetailsRouterImpl(factory: r.resolve(ViewControllerFactory.self)!)
        }
        
        container.register(DetailsService.self) { r in
            DetailsServiceImpl()
        }
    }
}

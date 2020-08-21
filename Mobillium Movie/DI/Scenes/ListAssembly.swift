//
//  ListAssembly.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Swinject
import UIKit

class ListAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ListViewController.self) { r in
            let viewController = ListViewControllerImpl(nibName: "ListViewController", bundle: nil)
            let presenter = r.resolve(ListPresenter.self)!
            let interactor = r.resolve(ListInteractor.self)!
            let router = r.resolve(ListRouter.self)!

            presenter.view = viewController
            presenter.router = router
            presenter.interactor = interactor
            viewController.presenter = presenter
            router.view = viewController

            return viewController
        }

        container.register(ListPresenter.self) { _ in
            ListPresenterImpl()
        }

        container.register(ListInteractor.self) { r in
            ListInteractorImpl(service: r.resolve(ListService.self)!)
        }

        container.register(ListRouter.self) { r in
            ListRouterImpl(factory: r.resolve(ViewControllerFactory.self)!)
        }
        
        container.register(ListService.self) { r in
            ListServiceImpl()
        }
    }
}

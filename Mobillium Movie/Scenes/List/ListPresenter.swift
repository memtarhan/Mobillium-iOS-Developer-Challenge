//
//  ListPresenter.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol ListPresenter: class {
    var view: ListViewController? { get set }
    var interactor: ListInteractor? { get set }
    var router: ListRouter? { get set }
    
    func present()
}

class ListPresenterImpl: ListPresenter {
    var view: ListViewController?
    var interactor: ListInteractor?
    var router: ListRouter?
    
    func present() {
        interactor?.retrive()
    }
}

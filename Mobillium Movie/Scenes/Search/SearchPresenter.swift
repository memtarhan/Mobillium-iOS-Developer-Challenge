//
//  SearchPresenter.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 20.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol SearchPresenter: class {
    var view: SearchViewController? { get set }
    var interactor: SearchInteractor? { get set }
    var router: SearchRouter? { get set }
}

class SearchPresenterImpl: SearchPresenter {
    var view: SearchViewController?
    var interactor: SearchInteractor?
    var router: SearchRouter?
}

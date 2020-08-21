//
//  DetailsPresenter.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol DetailsPresenter: class {
    var view: DetailsViewController? { get set }
    var interactor: DetailsInteractor? { get set }
    var router: DetailsRouter? { get set }
}

class DetailsPresenterImpl: DetailsPresenter {
    var view: DetailsViewController?
    var interactor: DetailsInteractor?
    var router: DetailsRouter?
}

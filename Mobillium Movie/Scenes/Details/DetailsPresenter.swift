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

    func present(_ id: String)
}

class DetailsPresenterImpl: DetailsPresenter {
    var view: DetailsViewController?
    var interactor: DetailsInteractor?
    var router: DetailsRouter?

    func present(_ id: String) {
        interactor?.retriveDetails(for: id, { result in
            switch result {
            case let .success(details):
                let response = DetailsEntity.Response(title: details.title,
                                                      rate: "\(Int(details.popularity))%",
                                                      overview: details.overview,
                                                      posterURL: "\(APIHelper.imagePath)\(details.posterPath)",
                                                      imdbId: details.imdbId)
                
                self.view?.display(response)

            case .failure:
                break
            }
        })
    }
}

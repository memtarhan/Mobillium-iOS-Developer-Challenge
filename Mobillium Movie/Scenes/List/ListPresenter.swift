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

    func present(_ list: ListType)
}

class ListPresenterImpl: ListPresenter {
    var view: ListViewController?
    var interactor: ListInteractor?
    var router: ListRouter?

    func present(_ list: ListType) {
        interactor?.retrieve(forList: list, { result in
            switch result {
            case let .success(movies):
                let response = movies.map { (movie) -> ListEntity.ViewModel in
                    ListEntity.ViewModel(title: movie.title,
                                         popularity: "\(Int(movie.popularity))%",
                                         releaseDate: movie.releaseDate,
                                         imageUrl: "\(APIHelper.imagePath)\(movie.posterPath)")
                }

                self.view?.display(response)

            case .failure:
                break
            }
        })
    }
}

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

    func present(_ keyword: String)
}

class SearchPresenterImpl: SearchPresenter {
    var view: SearchViewController?
    var interactor: SearchInteractor?
    var router: SearchRouter?

    func present(_ keyword: String) {
        interactor?.retrieve(forKeyword: keyword, { result in
            switch result {
            case let .success(movies):
                let response = movies.map { (movie) -> ListEntity.ViewModel in
                    ListEntity.ViewModel(title: movie.title,
                                         popularity: "\(Int(movie.popularity))%",
                                         releaseDate: movie.releaseDate,
                                         imageUrl: "\(APIHelper.imagePath)\(movie.posterPath)",
                                         id: "\(movie.id)")
                }

                self.view?.display(response)

            case .failure:
                break
            }
        })
    }
}

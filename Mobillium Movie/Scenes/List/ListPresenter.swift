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

    func present(forList list: ListType, changedType changed: Bool)
    func presentDetails(for movie: String)
    func presentSearch()
}

class ListPresenterImpl: ListPresenter {
    var view: ListViewController?
    var interactor: ListInteractor?
    var router: ListRouter?

    private var page = 1

    func present(forList list: ListType, changedType changed: Bool) {
        if changed { page = 1 }
        interactor?.retrieve(forList: list, page: page, { result in
            switch result {
            case let .success(movies):
                let response = movies.map { (movie) -> ListEntity.ViewModel in
                    let rateColor: UIColor!
                    if movie.popularity < 50 { rateColor = .red }
                    else if movie.popularity > 80 { rateColor = .green }
                    else { rateColor = .yellow }
                    
                    return ListEntity.ViewModel(title: movie.title,
                                         rateValue: CGFloat(movie.popularity / 100.0),
                                         ratePercentage: Int(movie.popularity),
                                         rateColor: rateColor,
                                         releaseDate: movie.releaseDate,
                                         imageUrl: "\(APIHelper.imagePath)\(movie.posterPath)",
                                         id: "\(movie.id)")
                }

                self.page += 1
                self.view?.display(response)

            case .failure:
                break
            }
        })
    }

    func presentDetails(for movie: String) {
        router?.navigateToDetails(forMovie: movie)
    }

    func presentSearch() {
        router?.navigateToSearch()
    }
}

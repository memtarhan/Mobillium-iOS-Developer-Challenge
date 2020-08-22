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
    func presentDetails(for movie: String)
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

                self.view?.display(response)

            case .failure:
                break
            }
        })
    }
    
    func presentDetails(for movie: String) {
        router?.navigateToDetails(forMovie: movie)
    }
}

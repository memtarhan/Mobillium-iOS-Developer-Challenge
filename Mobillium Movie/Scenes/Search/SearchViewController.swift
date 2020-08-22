//
//  SearchViewController.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 20.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol SearchViewController: class {
    var presenter: SearchPresenter? { get set }
}

class SearchViewControllerImpl: UIViewController {
    var presenter: SearchPresenter?

    var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.obscuresBackgroundDuringPresentation = false
        controller.hidesNavigationBarDuringPresentation = false
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.placeholder = "Search a movie"
        controller.searchBar.sizeToFit()
        controller.searchBar.becomeFirstResponder()

        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchController.searchBar.resignFirstResponder()
    }

    private func setup() {
        /// - Setting up search controller
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

// MARK: - SearchViewController

extension SearchViewControllerImpl: SearchViewController {
}

// MARK: - UISearchResultsUpdating

extension SearchViewControllerImpl: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
}

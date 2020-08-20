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

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        localize()
    }
    
    private func setup() {
        print(#function)
    }
    
    private func localize() {
    }
}

// MARK: - SearchViewController

extension SearchViewControllerImpl: SearchViewController {
}


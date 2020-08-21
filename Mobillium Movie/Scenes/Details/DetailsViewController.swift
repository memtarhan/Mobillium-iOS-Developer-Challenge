//
//  DetailsViewController.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol DetailsViewController: class {
    var presenter: DetailsPresenter? { get set }
}

class DetailsViewControllerImpl: UIViewController {
    var presenter: DetailsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        localize()
    }
    
    private func setup() {
    }
    
    private func localize() {
    }
}

// MARK: - DetailsViewController

extension DetailsViewControllerImpl: DetailsViewController {
}


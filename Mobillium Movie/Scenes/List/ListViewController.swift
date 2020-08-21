//
//  ListViewController.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol ListViewController: class {
    var presenter: ListPresenter? { get set }
}

class ListViewControllerImpl: UIViewController {
    var presenter: ListPresenter?

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

// MARK: - ListViewController

extension ListViewControllerImpl: ListViewController {
}


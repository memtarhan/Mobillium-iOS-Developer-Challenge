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

    func display(_ response: [ListEntity.ViewModel])
}

class SearchViewControllerImpl: UIViewController {
    var presenter: SearchPresenter?

    @IBOutlet var collectionView: UICollectionView!

    private let cellReuseIdentifier = "Movie"
    private let cellNibIdentifier = "MovieCollectionViewCell"

    private var models: [ListEntity.ViewModel] = []

    private var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.definesPresentationContext = true
        controller.isActive = true
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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async {
            self.searchController.searchBar.becomeFirstResponder()
        }
    }

    private func setup() {
        title = "Search"

        /// - Setting up collection view
        if let layout = collectionView.collectionViewLayout as? CustomLayout {
            layout.delegate = self
        }
        collectionView.contentInsetAdjustmentBehavior = .always
        let cellNib = UINib(nibName: cellNibIdentifier, bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: cellReuseIdentifier)

        /// - Setting up search controller
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

// MARK: - SearchViewController

extension SearchViewControllerImpl: SearchViewController {
    func display(_ response: [ListEntity.ViewModel]) {
        models = response
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UISearchResultsUpdating

extension SearchViewControllerImpl: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let keyword = searchController.searchBar.text {
            presenter?.present(keyword)
        }
    }
}

// MARK: - UICollectionViewDelegate - UICollectionViewDataSource

extension SearchViewControllerImpl: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CustomLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
        cell.model = models[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize * 1.5)
    }

    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return collectionView.frame.height / 3
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == models.count - 1 {
            // presenter?.present(forList: .nowPlaying, changedType: false)
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // presenter?.present(detailsFor: models[indexPath.row].id)
    }
}

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

    func display(_ response: [ListEntity.ViewModel])
}

class ListViewControllerImpl: UIViewController {
    var presenter: ListPresenter?

    @IBOutlet var collectionView: UICollectionView!

    private let cellReuseIdentifier = "Movie"
    private let cellNibIdentifier = "MovieCollectionViewCell"

    private var models: [ListEntity.ViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    private func setup() {
        title = "Mobillium Movie"

        /// - Setting up navigation bar's search button
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
        navigationItem.rightBarButtonItem = searchButton

        /// - Setting up collection view
        if let layout = collectionView.collectionViewLayout as? CustomLayout {
            layout.delegate = self
        }
        collectionView.contentInsetAdjustmentBehavior = .always
        let cellNib = UINib(nibName: cellNibIdentifier, bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: cellReuseIdentifier)

        presenter?.present(forList: .nowPlaying, changedType: false)
    }

    @IBAction func didChangeType(_ sender: UISegmentedControl) {
        let list = sender.selectedSegmentIndex == 0 ? ListType.nowPlaying : .upcoming
        models.removeAll()
        presenter?.present(forList: list, changedType: true)
    }

    @objc private func didTapSearch() {
    }
}

// MARK: - ListViewController

extension ListViewControllerImpl: ListViewController {
    func display(_ response: [ListEntity.ViewModel]) {
        models.append(contentsOf: response)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDelegate - UICollectionViewDataSource

extension ListViewControllerImpl: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CustomLayoutDelegate {
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
            presenter?.present(forList: .nowPlaying, changedType: false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.present(detailsFor: models[indexPath.row].id)
    }
}

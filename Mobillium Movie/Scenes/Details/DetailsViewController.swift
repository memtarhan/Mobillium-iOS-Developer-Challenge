//
//  DetailsViewController.swift
//  Mobillium Movie
//
//  Created Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Kingfisher
import UIKit

protocol DetailsViewController: class {
    var presenter: DetailsPresenter? { get set }

    var movieId: String? { get set }

    func display(_ response: DetailsEntity.Response)
}

class DetailsViewControllerImpl: UIViewController {
    var presenter: DetailsPresenter?

    var movieId: String?

    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var overviewTextView: UITextView!
    @IBOutlet var circularView: CircularProgressView!
    @IBOutlet var rateLabel: UILabel!

    private var response: DetailsEntity.Response?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.present(movieId ?? "")
    }

    @IBAction func didTapIMDbButton(_ sender: Any) {
        if let imdbId = response?.imdbId {
            let urlString = "\(APIHelper.imdbPath)\(imdbId)"
            if let url = URL(string: urlString) {
                UIApplication.shared.open(url)
            }
        }
    }
}

// MARK: - DetailsViewController

extension DetailsViewControllerImpl: DetailsViewController {
    func display(_ response: DetailsEntity.Response) {
        self.response = response
        DispatchQueue.main.async {
            self.posterImageView.kf.setImage(with: URL(string: response.posterURL))
            self.titleLabel.text = response.title.uppercased()
            self.overviewTextView.text = response.overview
            self.rateLabel.text = "\(response.ratePercentage)"
            self.circularView.fillBorder(response.rateValue)
            self.circularView.strokeColor = response.rateColor
        }
    }
}

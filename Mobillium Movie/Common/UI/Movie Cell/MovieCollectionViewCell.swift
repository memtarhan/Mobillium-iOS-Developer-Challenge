//
//  MovieCollectionViewCell.swift
//  Mobillium Movie
//
//  Created by Mehmet Tarhan on 21.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Kingfisher
import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet var coverImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!

    var model: ListEntity.ViewModel? {
        didSet {
            if let model = model {
                let imageUrl = URL(string: model.imageUrl)
                coverImageView.kf.setImage(with: imageUrl)
                titleLabel.text = model.title
                releaseDateLabel.text = model.releaseDate
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

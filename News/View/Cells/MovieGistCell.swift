//
//  MovieGistCell.swift
//  IMDB
//
//  Created by Hemant Singh on 28/05/22.
//

import UIKit

final class MovieGistCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var articleImageView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        articleImageView?.layer.cornerRadius = 8
        articleImageView?.layer.masksToBounds = true
    }
    
    internal func configureFor(movie: Movie) {
        titleLabel?.text = movie.title
        descriptionLabel?.text = movie.description
        if let url = movie.urlToImage {
            articleImageView?.setImage(with: url)
        } else {
            articleImageView?.image = UIImage()
        }
    }
}

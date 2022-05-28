//
//  MovieDetailsCell.swift
//  IMDB
//
//  Created by Hemant Singh on 28/05/22.
//

import UIKit

final class MovieDetailsCell: UITableViewCell {

    @IBOutlet weak var ratingLabel: UILabel?
    @IBOutlet weak var popularityLabel: UILabel?
    @IBOutlet weak var overviewLabel: UILabel?
    @IBOutlet weak var releaseDateLabel: UILabel?
    @IBOutlet weak var posterImageView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView?.layer.cornerRadius = 8
        posterImageView?.layer.masksToBounds = true
    }
    
    internal func configureFor(movie: Movie) {
        ratingLabel?.text = movie.rating.description
        overviewLabel?.text = movie.description
        popularityLabel?.text = movie.popularity.description
        releaseDateLabel?.text = movie.releaseDate
        if let url = movie.urlToImage {
            posterImageView?.setImage(with: url)
        } else {
            posterImageView?.image = UIImage()
        }
    }
    
}

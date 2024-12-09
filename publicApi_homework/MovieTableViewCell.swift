//
//  MovieTableViewCell.swift
//  publicApi_homework
//
//  Created by Bekzat on 7/12/24.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(movie: MovieItem) {
        print("Movie data: \(movie)")
        let posterBaseURL = "https://image.tmdb.org/t/p/w500"
        posterImageView.sd_setImage(with: URL(string: "\(posterBaseURL)\(movie.posterPath)"))
        ratingLabel.text = "Rating: \(movie.rating)"
        titleLabel.text = movie.title
        genreLabel.text = "Popularity: \(movie.popular)"
        overviewLabel.text = movie.overview
        releaseDateLabel.text = "Release: \(movie.releaseDate)"
    }


}

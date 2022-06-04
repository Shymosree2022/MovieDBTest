//
//  MovieListCellTableViewCell.swift
//  TheMovieDBTest
//
//  Created by Shymosree on 4/6/22.
//

import UIKit

class MovieListCellTableViewCell: UITableViewCell {

    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData (title : String, overview : String, url : String){
        self.movieTitleLabel.text = title
        self.movieTitleLabel.numberOfLines = 0
        self.movieTitleLabel.lineBreakMode = .byWordWrapping
        self.movieTitleLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        
        self.movieOverviewLabel.text = overview
        self.movieOverviewLabel.numberOfLines = 0
        self.movieOverviewLabel.lineBreakMode = .byWordWrapping
        //self.movieOverviewLabel.sizeToFit()
        
        guard let url = URL(string: url) else { return }
        UIImage.loadFrom(url: url) { image in
            self.movieImageView.image = image
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

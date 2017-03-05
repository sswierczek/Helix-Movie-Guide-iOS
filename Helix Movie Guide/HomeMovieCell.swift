//
//  MovieCell.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 12/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class HomeMovieCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    func bindMovie(movie: Movie) {
        label?.text = movie.original_title
        imageView?.loadImage(path: movie.getFullImagePath())
    }
}

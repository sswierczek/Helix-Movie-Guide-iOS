//
//  DetailsView.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 07/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

protocol DetailsView: class {
    func setItemId(id: Int)
    func showError(errorMessage: String)
    func showLoading(show: Bool)
    func showMovieDetails(movie: Movie)
    func showVideos(videos: [Video])
}

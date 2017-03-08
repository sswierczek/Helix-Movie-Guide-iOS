//
//  DetailsController.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 07/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {

    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var videoWebView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: Injected
    var presenter: DetailsPresenter?

    override func viewDidAppear(_ animated: Bool) {
        presenter?.attachView(view: self)
    }

    override func viewDidDisappear(_ animated: Bool) {
        presenter?.detachView()
    }
}

// MARK: DetailsView
extension DetailsController: DetailsView {

    func setItemId(id: Int) {
        presenter?.itemSelected(id: id)
    }

    func showError(errorMessage: String) {
        showSimpleErrorAlert(title: "feed_fetch_error".localized, body: errorMessage)
    }

    func showLoading(show: Bool) {
        activityIndicator.startAnimating(start: show)
    }

    func showMovieDetails(movie: Movie) {
        self.title = movie.title
        self.detailsImage.loadImage(path: movie.getFullImagePath())
    }

    func showVideos(videos: [Video]) {
        // FIXME implement trailers list
        if videos.count > 0, let url = URL(string: videos[0].getFullVideoUrl()) {
            videoWebView.loadRequest( URLRequest(url: url))
        }
    }
}

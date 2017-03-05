//
//  DetailsPresenter.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 07/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

import RxSwift
import ObjectMapper
import Alamofire
import AlamofireObjectMapper
import RxAlamofire

class DetailsPresenter {

    private let disposeBag: DisposeBag = DisposeBag()
    private let api: MovieApi?

    private weak var view: DetailsView?
    private var movieId: Int = -1

    public init(api: MovieApi) {
        self.api = api
    }

    func attachView(view: DetailsView) {
        self.view = view
        loadMovieDetails()
        loadVideos()
    }

    func detachView() {
        self.view = nil
    }

    public func itemSelected(id: Int) {
        self.movieId = id
    }

    private func loadMovieDetails() {
        api?.getMovieDetails(movieId: movieId)
            .subscribe(onNext: { movie in
                self.view?.showMovie(movie: movie)
            }, onError: { error in
                self.view?.showError(errorMessage: error.localizedDescription)
            })
            .addDisposableTo(disposeBag)
    }

    private func loadVideos() {
        api?.getVideos(movieId: movieId)
            .subscribe(onNext: { videos in
                self.view?.showVideos(videos: videos)
            }, onError: { error in
                self.view?.showError(errorMessage: error.localizedDescription)
            })
            .addDisposableTo(disposeBag)
    }

}

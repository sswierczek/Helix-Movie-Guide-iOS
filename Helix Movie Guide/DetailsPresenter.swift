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
    private let getMovieDetailsUseCase: GetMovieDetailsUseCase?
    private let getMovieVideosUseCase: GetMovieVideosUseCase?

    private weak var view: DetailsView?
    private var movieId: Int = -1

    public init(getMovieDetailsUseCase: GetMovieDetailsUseCase,
                getMovieVideosUseCase: GetMovieVideosUseCase) {
        self.getMovieDetailsUseCase = getMovieDetailsUseCase
        self.getMovieVideosUseCase = getMovieVideosUseCase
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
        guard movieId >= 0 else {
            return
        }

        self.view?.showLoading(show: true)
        getMovieDetailsUseCase?.execute(movieId: movieId)
            .subscribe(onNext: { movie in
                self.view?.showMovieDetails(movie: movie)
                self.view?.showLoading(show: false)
            }, onError: { error in
                self.view?.showError(errorMessage: error.localizedDescription)
                self.view?.showLoading(show: false)
            })
            .addDisposableTo(disposeBag)
    }

    private func loadVideos() {
        guard movieId >= 0 else {
            return
        }
        
        self.view?.showLoading(show: true)
        getMovieVideosUseCase?.execute(movieId: movieId)
            .subscribe(onNext: { videos in
                self.view?.showVideos(videos: videos)
                self.view?.showLoading(show: false)
            }, onError: { error in
                self.view?.showError(errorMessage: error.localizedDescription)
                self.view?.showLoading(show: false)
            })
            .addDisposableTo(disposeBag)
    }

}

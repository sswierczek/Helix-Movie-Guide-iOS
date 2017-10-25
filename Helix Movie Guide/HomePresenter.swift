//
//  MainPresenter.swift
//  Movie Guide
//
//  Created by user on 27/01/2017.
//  Copyright © 2017 user. All rights reserved.
//
import RxSwift
import ObjectMapper
import Alamofire
import AlamofireObjectMapper
import RxAlamofire

class HomePresenter {

    private let disposeBag: DisposeBag = DisposeBag()

    private let moviesDiscoverUseCase: GetMoviesDiscoverUseCase
    private let searchMoviesUseCase: SearchMoviesUseCase

    private weak var view: HomeView?

    private var page = 0

    public init(moviesDiscoverUseCase: GetMoviesDiscoverUseCase,
                searchMoviesUseCase: SearchMoviesUseCase) {
        self.moviesDiscoverUseCase = moviesDiscoverUseCase
        self.searchMoviesUseCase = searchMoviesUseCase
    }

    func attachView(view: HomeView) {
        self.view = view
    }

    func detachView() {
        self.view = nil
    }

    func scrolledToBottom() {
        page += 1
        moviesDiscoverUseCase.execute(page: page)
            .subscribe(onNext: { movies in
                self.view?.appendData(data: movies)
            }, onError: { error in
                self.view?.showError(errorMessage: error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }

    func searchTextChanged(text: String) {
        searchMoviesUseCase.execute(text: text)
            .subscribe(onNext: { movies in
                self.view?.replaceData(data: movies)
            }, onError: { error in
                self.view?.showError(errorMessage: error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
}

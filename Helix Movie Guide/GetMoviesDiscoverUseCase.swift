//
//  GetMoviesDiscoverUseCase.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 21/02/2017.
//  Copyright © 2017 user. All rights reserved.
//
import RxSwift

class GetMoviesDiscoverUseCase {

    private let api: MovieApi

    public init(api: MovieApi) {
        self.api = api
    }

    func execute(page: Int) -> Observable<[Movie]> {
        return api.getMoviesDiscover(page: page);
    }
}

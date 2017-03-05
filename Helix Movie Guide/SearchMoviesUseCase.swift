//
//  SearchMoviesUseCase.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 21/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

import RxSwift

class SearchMoviesUseCase {

    private let api: MovieApi

    public init(api: MovieApi) {
        self.api = api
    }

    func execute(text: String) -> Observable<[Movie]> {
        // FIXME Add some object with search logic
        return api.searchMovie(query: text)
    }
}

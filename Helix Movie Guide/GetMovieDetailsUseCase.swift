//
//  GetMovieDetails.swift
//  Helix Movie Guide
//
//  Created by Sebastian Swierczek on 08/03/2017.
//  Copyright © 2017 user. All rights reserved.
//

import RxSwift

class GetMovieDetailsUseCase {

    private let api: MovieApi

    public init(api: MovieApi) {
        self.api = api
    }

    func execute(movieId: Int) -> Observable<Movie> {
        return api.getMovieDetails(movieId: movieId)
    }
}

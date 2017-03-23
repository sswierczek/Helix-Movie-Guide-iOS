//
//  GetMovieVideosUseCaseTest.swift
//  Helix Movie Guide
//
//  Created by Sebastian Swierczek on 17/03/2017.
//  Copyright © 2017 user. All rights reserved.
//
@testable import Helix_Movie_Guide
import XCTest
import Cuckoo
import ObjectMapper
import RxSwift

class GetMovieVideosUseCaseTest: XCTestCase {

    var api: MockMovieApi = MockMovieApi()
    var getMovieVideosUseCase: GetMovieVideosUseCase?

    override func setUp() {
        getMovieVideosUseCase = GetMovieVideosUseCase(api: api)
    }

    func test_WHEN_execute_THEN_callApi() {
        let executedMovieId = 1
        stub(api) { stub in
            when(stub.getVideos(movieId: executedMovieId)).thenReturn(Observable.empty())
        }

        _ = getMovieVideosUseCase?.execute(movieId: executedMovieId)

        verify(api).getVideos(movieId: executedMovieId)
    }
}

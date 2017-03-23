//
//  GetMovieDetailsUseCaseTest.swift
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

class GetMovieDetailsUseCaseTest: XCTestCase {

    var api: MockMovieApi = MockMovieApi()
    var getMovieDetailsUseCase: GetMovieDetailsUseCase?

    override func setUp() {
        getMovieDetailsUseCase = GetMovieDetailsUseCase(api: api)
    }

    func test_WHEN_execute_THEN_callApi() {
        let executedMovieId = 1
        stub(api) { stub in
            when(stub.getMovieDetails(movieId: executedMovieId)).thenReturn(Observable.empty())
        }

        _ = getMovieDetailsUseCase?.execute(movieId: executedMovieId)

        verify(api).getMovieDetails(movieId: executedMovieId)
    }
}

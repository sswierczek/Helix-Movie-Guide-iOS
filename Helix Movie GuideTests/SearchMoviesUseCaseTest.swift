//
//  SearchMoviesUseCaseTest.swift
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

class SearchMoviesUseCaseTest: XCTestCase {

    var api: MockMovieApi = MockMovieApi()
    var searchMoviesUseCase: SearchMoviesUseCase?

    override func setUp() {
        searchMoviesUseCase = SearchMoviesUseCase(api: api)
    }

    func test_WHEN_execute_THEN_callApi() {
        let executedQuery = "example query"
        stub(api) { stub in
            when(stub.searchMovie(query: executedQuery)).thenReturn(Observable.empty())
        }

        searchMoviesUseCase?.execute(text: executedQuery)

        verify(api).searchMovie(query: executedQuery)
    }
}

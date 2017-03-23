//
//  GetMoviesDiscoverUseCaseTest.swift
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

class GetMoviesDiscoverUseCaseTest: XCTestCase {

    var api: MockMovieApi = MockMovieApi()
    var getMoviesDiscoverUseCase: GetMoviesDiscoverUseCase?

    override func setUp() {
        getMoviesDiscoverUseCase = GetMoviesDiscoverUseCase(api: api)
    }

    func test_WHEN_execute_THEN_callApi() {
        let discoverPage = 1
        stub(api) { stub in
            when(stub.getMoviesDiscover(page: discoverPage)).thenReturn(Observable.empty())
        }

        _ = getMoviesDiscoverUseCase?.execute(page: discoverPage)

        verify(api).getMoviesDiscover(page: discoverPage)
    }
}

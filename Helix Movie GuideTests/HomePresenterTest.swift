//
//  HomePresenterTest.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 10/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

@testable import Helix_Movie_Guide
import XCTest
import Cuckoo
import ObjectMapper
import RxSwift

class HomePresenterTest: XCTestCase {

    var api: MockMovieApi?
    var discoverUseCase: MockGetMoviesDiscoverUseCase?
    var searchUseCase: MockSearchMoviesUseCase?

    var homePresenter: HomePresenter?

    override func setUp() {
        super.setUp()
        // FIXME Find a way to ommit constructor arguments in generated mocks
        api = MockMovieApi()
        discoverUseCase = MockGetMoviesDiscoverUseCase(api: api!)
        searchUseCase = MockSearchMoviesUseCase(api: api!)
        homePresenter = HomePresenter(moviesDiscoverUseCase: discoverUseCase!, searchMoviesUseCase: searchUseCase!)
    }

    func test_WHEN_scrolled_to_bottom_THEN_load_next_page() {
        let firstPage = 1
        stub(discoverUseCase!) { stub in
            when(stub.execute(page: firstPage)).thenReturn(Observable.empty())
        }

        homePresenter?.scrolledToBottom()

        verify(discoverUseCase!).execute(page: firstPage)
    }
}

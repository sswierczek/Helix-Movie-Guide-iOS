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

    // FIXME Find a way to ommit constructor arguments in generated mocks
    var discoverUseCase = MockGetMoviesDiscoverUseCase(api: MockMovieApi())
    var searchUseCase = MockSearchMoviesUseCase(api: MockMovieApi())

    var homePresenter: HomePresenter?

    override func setUp() {
        super.setUp()
        homePresenter = HomePresenter(moviesDiscoverUseCase: discoverUseCase,
                                      searchMoviesUseCase: searchUseCase)
    }

    func test_WHEN_scrolled_to_bottom_THEN_load_next_page() {
        let firstPage = 1
        stub(discoverUseCase) { stub in
            when(stub.execute(page: firstPage)).thenReturn(Observable.empty())
        }

        homePresenter?.scrolledToBottom()

        verify(discoverUseCase).execute(page: firstPage)
    }
}

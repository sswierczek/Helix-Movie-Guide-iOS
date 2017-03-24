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

enum FakeError: Error {
    case error
}

class HomePresenterTest: XCTestCase {

    // FIXME Find a way to ommit constructor arguments in generated mocks
    var discoverUseCase = MockGetMoviesDiscoverUseCase(api: MockMovieApi())
    var searchUseCase = MockSearchMoviesUseCase(api: MockMovieApi())
    var view = MockHomeView()
    var firstPage = 1
    var searchQuery = "Query example"

    var homePresenter: HomePresenter?

    override func setUp() {
        super.setUp()
        homePresenter = HomePresenter(moviesDiscoverUseCase: discoverUseCase,
                                      searchMoviesUseCase: searchUseCase)
        homePresenter?.attachView(view: view)
        stub(view) { stub in
            when(stub.showError(errorMessage: anyString())).thenDoNothing()
            when(stub.appendData(data: any())).thenDoNothing()
            when(stub.replaceData(data: any())).thenDoNothing()
        }
    }

    override func tearDown() {
        homePresenter?.detachView()
    }

    func test_WHEN_scrolledToBottom_THEN_loadNextPage() {
        stub(discoverUseCase) { stub in
            when(stub.execute(page: firstPage)).thenReturn(Observable.empty())
        }

        homePresenter?.scrolledToBottom()

        verify(discoverUseCase).execute(page: firstPage)
    }

    func test_WHEN_errorDuringDiscoverFetch_THEN_showsError() {
        stub(discoverUseCase) { stub in
            when(stub.execute(page: firstPage)).thenReturn(Observable.error(FakeError.error))
        }

        homePresenter?.scrolledToBottom()

        verify(view).showError(errorMessage: FakeError.error.localizedDescription)
    }

    func test_WHEN_scrolledToBottom_THEN_appendNewDataToView() {
        let data = [Movie(JSONString: "{\"id\":1234}")!]
        stub(discoverUseCase) { stub in
            when(stub.execute(page: firstPage)).thenReturn(Observable.just(data))
        }

        homePresenter?.scrolledToBottom()

        let argumentCaptor = ArgumentCaptor<[Movie]>()
        verify(view).appendData(data: argumentCaptor.capture())
        XCTAssertEqual(argumentCaptor.value?[0].id, 1234) // Done like that as array is not Matchable
    }

    func test_WHEN_searchTextEntered_THEN_invokeSearchUseCase() {
        stub(searchUseCase) { stub in
            when(stub.execute(text: searchQuery)).thenReturn(Observable.empty())
        }

        homePresenter?.searchTextChanged(text: searchQuery)

        verify(searchUseCase).execute(text: searchQuery)
    }

    func test_WHEN_searchTextEntered_THEN_replaceExistingData() {
        let data = [Movie(JSONString: "{\"id\":1234}")!]
        stub(searchUseCase) { stub in
            when(stub.execute(text: searchQuery)).thenReturn(Observable.just(data))
        }

        homePresenter?.searchTextChanged(text: searchQuery)

        let argumentCaptor = ArgumentCaptor<[Movie]>()
        verify(view).replaceData(data: argumentCaptor.capture())
        XCTAssertEqual(argumentCaptor.value?[0].id, 1234) // Done like that as array is not Matchable
    }

    func test_WHEN_errorDuringSearch_THEN_showsError() {
        stub(searchUseCase) { stub in
            when(stub.execute(text: searchQuery)).thenReturn(Observable.error(FakeError.error))
        }

        homePresenter?.searchTextChanged(text: searchQuery)

        verify(view).showError(errorMessage: FakeError.error.localizedDescription)
    }
}

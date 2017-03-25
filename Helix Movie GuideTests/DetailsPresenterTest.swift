//
//  DetailsPresenterTest.swift
//  Helix Movie Guide
//
//  Created by Sebastian Swierczek on 25/03/2017.
//  Copyright © 2017 user. All rights reserved.
//

@testable import Helix_Movie_Guide
import XCTest
import Cuckoo
import ObjectMapper
import RxSwift

enum TestError: Error {
    case error
}

class DetailsPresenterTest: XCTestCase {

    // FIXME Find a way to ommit constructor arguments in generated mocks
    var detailsUseCase = MockGetMovieDetailsUseCase(api: MockMovieApi())
    var movieVideosUseCase = MockGetMovieVideosUseCase(api: MockMovieApi())
    var view = MockDetailsView()
    var testMovieId = 1234

    var detailsPresenter: DetailsPresenter?

    override func setUp() {
        super.setUp()
        detailsPresenter = DetailsPresenter(getMovieDetailsUseCase: detailsUseCase,
                                            getMovieVideosUseCase: movieVideosUseCase)
        stub(view) { stub in
            when(stub.showError(errorMessage: anyString())).thenDoNothing()
            when(stub.showLoading(show: any())).thenDoNothing()
            when(stub.showMovieDetails(movie: any())).thenDoNothing()
            when(stub.showVideos(videos: any())).thenDoNothing()
        }

        mock_movieDetails(movie: nil)
        mock_videos(videos: nil)
    }

    override func tearDown() {
        detailsPresenter?.detachView()
    }

    func test_GIVEN_movieId_WHEN_attachView_THEN_loadMovieDetails() {
        detailsPresenter?.itemSelected(id: testMovieId)

        detailsPresenter?.attachView(view: view)

        verify(detailsUseCase).execute(movieId: testMovieId)
    }

    func test_GIVEN_movieId_WHEN_attachView_THEN_loadMovieVideos() {
        detailsPresenter?.itemSelected(id: testMovieId)

        detailsPresenter?.attachView(view: view)

        verify(movieVideosUseCase).execute(movieId: testMovieId)
    }

    func test_GIVEN_noMovieId_WHEN_attachView_THEN_doNothing() {
        detailsPresenter?.attachView(view: view)

        verify(detailsUseCase, never()).execute(movieId: anyInt())
        verify(movieVideosUseCase, never()).execute(movieId: anyInt())
    }

    func test_WHEN_movieFetched_THEN_showMovieDetails() {
        mock_movieDetails(movie: Movie(JSONString: "{\"id\":\"\(testMovieId)\"}"))
        detailsPresenter?.itemSelected(id: testMovieId)

        detailsPresenter?.attachView(view: view)

        verify(view).showMovieDetails(movie: any())
    }

    func test_WHEN_movieVideosFetched_THEN_showVideos() {
        mock_videos(videos: [Video(JSONString: "{\"id\":\"\(testMovieId)\"}")!])
        detailsPresenter?.itemSelected(id: testMovieId)

        detailsPresenter?.attachView(view: view)

        verify(view).showVideos(videos: any())
    }

    func test_WHEN_errorFetchingDetails_THEN_showsError() {
        mock_movieDetails(error: TestError.error)
        detailsPresenter?.itemSelected(id: testMovieId)

        detailsPresenter?.attachView(view: view)

        verify(view).showError(errorMessage: TestError.error.localizedDescription)
    }

    func test_WHEN_errorFetchingVideos_THEN_showsError() {
        mock_videos(error: TestError.error)
        detailsPresenter?.itemSelected(id: testMovieId)

        detailsPresenter?.attachView(view: view)

        verify(view).showError(errorMessage: TestError.error.localizedDescription)
    }

    func mock_movieDetails(movie: Movie?) {
        let data = movie == nil ? Observable.empty() : Observable.just(movie!)


        stub(detailsUseCase) { stub in
            when(stub.execute(movieId: anyInt())).thenReturn(data)
        }
    }

    func mock_movieDetails(error: TestError) {
        stub(detailsUseCase) { stub in
            when(stub.execute(movieId: anyInt())).thenReturn(Observable.error(error))
        }
    }

    func mock_videos(videos: [Video]?) {
        let data = videos == nil ? Observable.empty() : Observable.just(videos!)

        stub(movieVideosUseCase) { stub in
            when(stub.execute(movieId: anyInt())).thenReturn(data)
        }
    }

    func mock_videos(error: TestError) {
        stub(movieVideosUseCase) { stub in
            when(stub.execute(movieId: anyInt())).thenReturn(Observable.error(error))
        }
    }
}

// MARK: - Mocks generated from file: Helix Movie Guide/MovieApi.swift at 2017-03-25 19:52:22 +0000

//
//  MovieApi.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 09/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

import Cuckoo
@testable import Helix_Movie_Guide

import RxSwift

class MockMovieApi: MovieApi, Cuckoo.Mock {
    typealias MocksType = MovieApi
    typealias Stubbing = __StubbingProxy_MovieApi
    typealias Verification = __VerificationProxy_MovieApi
    let manager = Cuckoo.MockManager()
    
    private var observed: MovieApi?
    
    func spy(on victim: MovieApi) -> Self {
        observed = victim
        return self
    }
    
    func getMoviesDiscover(page: Int) -> Observable<[Movie]> {
        return manager.call("getMoviesDiscover(page: Int) -> Observable<[Movie]>", parameters: (page), original: observed.map { o in return { (page: Int) -> Observable<[Movie]> in o.getMoviesDiscover(page: page) } })
    }
    
    func getMovieDetails(movieId: Int) -> Observable<Movie> {
        return manager.call("getMovieDetails(movieId: Int) -> Observable<Movie>", parameters: (movieId), original: observed.map { o in return { (movieId: Int) -> Observable<Movie> in o.getMovieDetails(movieId: movieId) } })
    }
    
    func getVideos(movieId: Int) -> Observable<[Video]> {
        return manager.call("getVideos(movieId: Int) -> Observable<[Video]>", parameters: (movieId), original: observed.map { o in return { (movieId: Int) -> Observable<[Video]> in o.getVideos(movieId: movieId) } })
    }
    
    func searchMovie(query: String) -> Observable<[Movie]> {
        return manager.call("searchMovie(query: String) -> Observable<[Movie]>", parameters: (query), original: observed.map { o in return { (query: String) -> Observable<[Movie]> in o.searchMovie(query: query) } })
    }
    
    struct __StubbingProxy_MovieApi: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func getMoviesDiscover<M1: Cuckoo.Matchable>(page: M1) -> Cuckoo.StubFunction<(Int), Observable<[Movie]>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: page) { $0 }]
            return Cuckoo.StubFunction(stub: manager.createStub("getMoviesDiscover(page: Int) -> Observable<[Movie]>", parameterMatchers: matchers))
        }
        
        func getMovieDetails<M1: Cuckoo.Matchable>(movieId: M1) -> Cuckoo.StubFunction<(Int), Observable<Movie>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: movieId) { $0 }]
            return Cuckoo.StubFunction(stub: manager.createStub("getMovieDetails(movieId: Int) -> Observable<Movie>", parameterMatchers: matchers))
        }
        
        func getVideos<M1: Cuckoo.Matchable>(movieId: M1) -> Cuckoo.StubFunction<(Int), Observable<[Video]>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: movieId) { $0 }]
            return Cuckoo.StubFunction(stub: manager.createStub("getVideos(movieId: Int) -> Observable<[Video]>", parameterMatchers: matchers))
        }
        
        func searchMovie<M1: Cuckoo.Matchable>(query: M1) -> Cuckoo.StubFunction<(String), Observable<[Movie]>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: query) { $0 }]
            return Cuckoo.StubFunction(stub: manager.createStub("searchMovie(query: String) -> Observable<[Movie]>", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_MovieApi: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func getMoviesDiscover<M1: Cuckoo.Matchable>(page: M1) -> Cuckoo.__DoNotUse<Observable<[Movie]>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: page) { $0 }]
            return manager.verify("getMoviesDiscover(page: Int) -> Observable<[Movie]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func getMovieDetails<M1: Cuckoo.Matchable>(movieId: M1) -> Cuckoo.__DoNotUse<Observable<Movie>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: movieId) { $0 }]
            return manager.verify("getMovieDetails(movieId: Int) -> Observable<Movie>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func getVideos<M1: Cuckoo.Matchable>(movieId: M1) -> Cuckoo.__DoNotUse<Observable<[Video]>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: movieId) { $0 }]
            return manager.verify("getVideos(movieId: Int) -> Observable<[Video]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func searchMovie<M1: Cuckoo.Matchable>(query: M1) -> Cuckoo.__DoNotUse<Observable<[Movie]>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: query) { $0 }]
            return manager.verify("searchMovie(query: String) -> Observable<[Movie]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class MovieApiStub: MovieApi {
    
    func getMoviesDiscover(page: Int) -> Observable<[Movie]> {
        return DefaultValueRegistry.defaultValue(for: (Observable<[Movie]>).self)
    }
    
    func getMovieDetails(movieId: Int) -> Observable<Movie> {
        return DefaultValueRegistry.defaultValue(for: (Observable<Movie>).self)
    }
    
    func getVideos(movieId: Int) -> Observable<[Video]> {
        return DefaultValueRegistry.defaultValue(for: (Observable<[Video]>).self)
    }
    
    func searchMovie(query: String) -> Observable<[Movie]> {
        return DefaultValueRegistry.defaultValue(for: (Observable<[Movie]>).self)
    }
}

// MARK: - Mocks generated from file: Helix Movie Guide/DetailsView.swift at 2017-03-25 19:52:22 +0000

//
//  DetailsView.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 07/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

import Cuckoo
@testable import Helix_Movie_Guide

class MockDetailsView: DetailsView, Cuckoo.Mock {
    typealias MocksType = DetailsView
    typealias Stubbing = __StubbingProxy_DetailsView
    typealias Verification = __VerificationProxy_DetailsView
    let manager = Cuckoo.MockManager()
    
    private var observed: DetailsView?
    
    func spy(on victim: DetailsView) -> Self {
        observed = victim
        return self
    }
    
    func setItemId(id: Int) {
        return manager.call("setItemId(id: Int)", parameters: (id), original: observed.map { o in return { (id: Int) in o.setItemId(id: id) } })
    }
    
    func showError(errorMessage: String) {
        return manager.call("showError(errorMessage: String)", parameters: (errorMessage), original: observed.map { o in return { (errorMessage: String) in o.showError(errorMessage: errorMessage) } })
    }
    
    func showLoading(show: Bool) {
        return manager.call("showLoading(show: Bool)", parameters: (show), original: observed.map { o in return { (show: Bool) in o.showLoading(show: show) } })
    }
    
    func showMovieDetails(movie: Movie) {
        return manager.call("showMovieDetails(movie: Movie)", parameters: (movie), original: observed.map { o in return { (movie: Movie) in o.showMovieDetails(movie: movie) } })
    }
    
    func showVideos(videos: [Video]) {
        return manager.call("showVideos(videos: [Video])", parameters: (videos), original: observed.map { o in return { (videos: [Video]) in o.showVideos(videos: videos) } })
    }
    
    struct __StubbingProxy_DetailsView: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func setItemId<M1: Cuckoo.Matchable>(id: M1) -> Cuckoo.StubNoReturnFunction<(Int)> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: id) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("setItemId(id: Int)", parameterMatchers: matchers))
        }
        
        func showError<M1: Cuckoo.Matchable>(errorMessage: M1) -> Cuckoo.StubNoReturnFunction<(String)> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: errorMessage) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("showError(errorMessage: String)", parameterMatchers: matchers))
        }
        
        func showLoading<M1: Cuckoo.Matchable>(show: M1) -> Cuckoo.StubNoReturnFunction<(Bool)> where M1.MatchedType == Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: show) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("showLoading(show: Bool)", parameterMatchers: matchers))
        }
        
        func showMovieDetails<M1: Cuckoo.Matchable>(movie: M1) -> Cuckoo.StubNoReturnFunction<(Movie)> where M1.MatchedType == Movie {
            let matchers: [Cuckoo.ParameterMatcher<(Movie)>] = [wrap(matchable: movie) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("showMovieDetails(movie: Movie)", parameterMatchers: matchers))
        }
        
        func showVideos<M1: Cuckoo.Matchable>(videos: M1) -> Cuckoo.StubNoReturnFunction<([Video])> where M1.MatchedType == [Video] {
            let matchers: [Cuckoo.ParameterMatcher<([Video])>] = [wrap(matchable: videos) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("showVideos(videos: [Video])", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_DetailsView: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func setItemId<M1: Cuckoo.Matchable>(id: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: id) { $0 }]
            return manager.verify("setItemId(id: Int)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func showError<M1: Cuckoo.Matchable>(errorMessage: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: errorMessage) { $0 }]
            return manager.verify("showError(errorMessage: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func showLoading<M1: Cuckoo.Matchable>(show: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: show) { $0 }]
            return manager.verify("showLoading(show: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func showMovieDetails<M1: Cuckoo.Matchable>(movie: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Movie {
            let matchers: [Cuckoo.ParameterMatcher<(Movie)>] = [wrap(matchable: movie) { $0 }]
            return manager.verify("showMovieDetails(movie: Movie)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func showVideos<M1: Cuckoo.Matchable>(videos: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [Video] {
            let matchers: [Cuckoo.ParameterMatcher<([Video])>] = [wrap(matchable: videos) { $0 }]
            return manager.verify("showVideos(videos: [Video])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class DetailsViewStub: DetailsView {
    
    func setItemId(id: Int) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    func showError(errorMessage: String) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    func showLoading(show: Bool) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    func showMovieDetails(movie: Movie) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    func showVideos(videos: [Video]) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
}

// MARK: - Mocks generated from file: Helix Movie Guide/GetMovieVideosUseCase.swift at 2017-03-25 19:52:22 +0000

//
//  GetMovieVideosUseCase.swift
//  Helix Movie Guide
//
//  Created by Sebastian Swierczek on 08/03/2017.
//  Copyright © 2017 user. All rights reserved.
//

import Cuckoo
@testable import Helix_Movie_Guide

import RxSwift

class MockGetMovieVideosUseCase: GetMovieVideosUseCase, Cuckoo.Mock {
    typealias MocksType = GetMovieVideosUseCase
    typealias Stubbing = __StubbingProxy_GetMovieVideosUseCase
    typealias Verification = __VerificationProxy_GetMovieVideosUseCase
    let manager = Cuckoo.MockManager()
    
    private var observed: GetMovieVideosUseCase?
    
    func spy(on victim: GetMovieVideosUseCase) -> Self {
        observed = victim
        return self
    }
    
    override func execute(movieId: Int) -> Observable<[Video]> {
        return manager.call("execute(movieId: Int) -> Observable<[Video]>", parameters: (movieId), original: observed.map { o in return { (movieId: Int) -> Observable<[Video]> in o.execute(movieId: movieId) } })
    }
    
    struct __StubbingProxy_GetMovieVideosUseCase: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func execute<M1: Cuckoo.Matchable>(movieId: M1) -> Cuckoo.StubFunction<(Int), Observable<[Video]>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: movieId) { $0 }]
            return Cuckoo.StubFunction(stub: manager.createStub("execute(movieId: Int) -> Observable<[Video]>", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_GetMovieVideosUseCase: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func execute<M1: Cuckoo.Matchable>(movieId: M1) -> Cuckoo.__DoNotUse<Observable<[Video]>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: movieId) { $0 }]
            return manager.verify("execute(movieId: Int) -> Observable<[Video]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class GetMovieVideosUseCaseStub: GetMovieVideosUseCase {
    
    override func execute(movieId: Int) -> Observable<[Video]> {
        return DefaultValueRegistry.defaultValue(for: (Observable<[Video]>).self)
    }
}

// MARK: - Mocks generated from file: Helix Movie Guide/HomeView.swift at 2017-03-25 19:52:22 +0000

//
//  MainView.swift
//  Movie Guide
//
//  Created by user on 27/01/2017.
//  Copyright © 2017 user. All rights reserved.
//

import Cuckoo
@testable import Helix_Movie_Guide

class MockHomeView: HomeView, Cuckoo.Mock {
    typealias MocksType = HomeView
    typealias Stubbing = __StubbingProxy_HomeView
    typealias Verification = __VerificationProxy_HomeView
    let manager = Cuckoo.MockManager()
    
    private var observed: HomeView?
    
    func spy(on victim: HomeView) -> Self {
        observed = victim
        return self
    }
    
    func showError(errorMessage: String) {
        return manager.call("showError(errorMessage: String)", parameters: (errorMessage), original: observed.map { o in return { (errorMessage: String) in o.showError(errorMessage: errorMessage) } })
    }
    
    func appendData(data: [Movie]) {
        return manager.call("appendData(data: [Movie])", parameters: (data), original: observed.map { o in return { (data: [Movie]) in o.appendData(data: data) } })
    }
    
    func replaceData(data: [Movie]) {
        return manager.call("replaceData(data: [Movie])", parameters: (data), original: observed.map { o in return { (data: [Movie]) in o.replaceData(data: data) } })
    }
    
    struct __StubbingProxy_HomeView: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func showError<M1: Cuckoo.Matchable>(errorMessage: M1) -> Cuckoo.StubNoReturnFunction<(String)> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: errorMessage) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("showError(errorMessage: String)", parameterMatchers: matchers))
        }
        
        func appendData<M1: Cuckoo.Matchable>(data: M1) -> Cuckoo.StubNoReturnFunction<([Movie])> where M1.MatchedType == [Movie] {
            let matchers: [Cuckoo.ParameterMatcher<([Movie])>] = [wrap(matchable: data) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("appendData(data: [Movie])", parameterMatchers: matchers))
        }
        
        func replaceData<M1: Cuckoo.Matchable>(data: M1) -> Cuckoo.StubNoReturnFunction<([Movie])> where M1.MatchedType == [Movie] {
            let matchers: [Cuckoo.ParameterMatcher<([Movie])>] = [wrap(matchable: data) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("replaceData(data: [Movie])", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_HomeView: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func showError<M1: Cuckoo.Matchable>(errorMessage: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: errorMessage) { $0 }]
            return manager.verify("showError(errorMessage: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func appendData<M1: Cuckoo.Matchable>(data: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [Movie] {
            let matchers: [Cuckoo.ParameterMatcher<([Movie])>] = [wrap(matchable: data) { $0 }]
            return manager.verify("appendData(data: [Movie])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func replaceData<M1: Cuckoo.Matchable>(data: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [Movie] {
            let matchers: [Cuckoo.ParameterMatcher<([Movie])>] = [wrap(matchable: data) { $0 }]
            return manager.verify("replaceData(data: [Movie])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class HomeViewStub: HomeView {
    
    func showError(errorMessage: String) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    func appendData(data: [Movie]) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    func replaceData(data: [Movie]) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
}

// MARK: - Mocks generated from file: Helix Movie Guide/SearchMoviesUseCase.swift at 2017-03-25 19:52:22 +0000

//
//  SearchMoviesUseCase.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 21/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

import Cuckoo
@testable import Helix_Movie_Guide

import RxSwift

class MockSearchMoviesUseCase: SearchMoviesUseCase, Cuckoo.Mock {
    typealias MocksType = SearchMoviesUseCase
    typealias Stubbing = __StubbingProxy_SearchMoviesUseCase
    typealias Verification = __VerificationProxy_SearchMoviesUseCase
    let manager = Cuckoo.MockManager()
    
    private var observed: SearchMoviesUseCase?
    
    func spy(on victim: SearchMoviesUseCase) -> Self {
        observed = victim
        return self
    }
    
    override func execute(text: String) -> Observable<[Movie]> {
        return manager.call("execute(text: String) -> Observable<[Movie]>", parameters: (text), original: observed.map { o in return { (text: String) -> Observable<[Movie]> in o.execute(text: text) } })
    }
    
    struct __StubbingProxy_SearchMoviesUseCase: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func execute<M1: Cuckoo.Matchable>(text: M1) -> Cuckoo.StubFunction<(String), Observable<[Movie]>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: text) { $0 }]
            return Cuckoo.StubFunction(stub: manager.createStub("execute(text: String) -> Observable<[Movie]>", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_SearchMoviesUseCase: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func execute<M1: Cuckoo.Matchable>(text: M1) -> Cuckoo.__DoNotUse<Observable<[Movie]>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: text) { $0 }]
            return manager.verify("execute(text: String) -> Observable<[Movie]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class SearchMoviesUseCaseStub: SearchMoviesUseCase {
    
    override func execute(text: String) -> Observable<[Movie]> {
        return DefaultValueRegistry.defaultValue(for: (Observable<[Movie]>).self)
    }
}

// MARK: - Mocks generated from file: Helix Movie Guide/GetMoviesDiscoverUseCase.swift at 2017-03-25 19:52:22 +0000

//
//  GetMoviesDiscoverUseCase.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 21/02/2017.
//  Copyright © 2017 user. All rights reserved.
//
import Cuckoo
@testable import Helix_Movie_Guide

import RxSwift

class MockGetMoviesDiscoverUseCase: GetMoviesDiscoverUseCase, Cuckoo.Mock {
    typealias MocksType = GetMoviesDiscoverUseCase
    typealias Stubbing = __StubbingProxy_GetMoviesDiscoverUseCase
    typealias Verification = __VerificationProxy_GetMoviesDiscoverUseCase
    let manager = Cuckoo.MockManager()
    
    private var observed: GetMoviesDiscoverUseCase?
    
    func spy(on victim: GetMoviesDiscoverUseCase) -> Self {
        observed = victim
        return self
    }
    
    override func execute(page: Int) -> Observable<[Movie]> {
        return manager.call("execute(page: Int) -> Observable<[Movie]>", parameters: (page), original: observed.map { o in return { (page: Int) -> Observable<[Movie]> in o.execute(page: page) } })
    }
    
    struct __StubbingProxy_GetMoviesDiscoverUseCase: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func execute<M1: Cuckoo.Matchable>(page: M1) -> Cuckoo.StubFunction<(Int), Observable<[Movie]>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: page) { $0 }]
            return Cuckoo.StubFunction(stub: manager.createStub("execute(page: Int) -> Observable<[Movie]>", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_GetMoviesDiscoverUseCase: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func execute<M1: Cuckoo.Matchable>(page: M1) -> Cuckoo.__DoNotUse<Observable<[Movie]>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: page) { $0 }]
            return manager.verify("execute(page: Int) -> Observable<[Movie]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class GetMoviesDiscoverUseCaseStub: GetMoviesDiscoverUseCase {
    
    override func execute(page: Int) -> Observable<[Movie]> {
        return DefaultValueRegistry.defaultValue(for: (Observable<[Movie]>).self)
    }
}

// MARK: - Mocks generated from file: Helix Movie Guide/GetMovieDetailsUseCase.swift at 2017-03-25 19:52:22 +0000

//
//  GetMovieDetails.swift
//  Helix Movie Guide
//
//  Created by Sebastian Swierczek on 08/03/2017.
//  Copyright © 2017 user. All rights reserved.
//

import Cuckoo
@testable import Helix_Movie_Guide

import RxSwift

class MockGetMovieDetailsUseCase: GetMovieDetailsUseCase, Cuckoo.Mock {
    typealias MocksType = GetMovieDetailsUseCase
    typealias Stubbing = __StubbingProxy_GetMovieDetailsUseCase
    typealias Verification = __VerificationProxy_GetMovieDetailsUseCase
    let manager = Cuckoo.MockManager()
    
    private var observed: GetMovieDetailsUseCase?
    
    func spy(on victim: GetMovieDetailsUseCase) -> Self {
        observed = victim
        return self
    }
    
    override func execute(movieId: Int) -> Observable<Movie> {
        return manager.call("execute(movieId: Int) -> Observable<Movie>", parameters: (movieId), original: observed.map { o in return { (movieId: Int) -> Observable<Movie> in o.execute(movieId: movieId) } })
    }
    
    struct __StubbingProxy_GetMovieDetailsUseCase: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func execute<M1: Cuckoo.Matchable>(movieId: M1) -> Cuckoo.StubFunction<(Int), Observable<Movie>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: movieId) { $0 }]
            return Cuckoo.StubFunction(stub: manager.createStub("execute(movieId: Int) -> Observable<Movie>", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_GetMovieDetailsUseCase: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func execute<M1: Cuckoo.Matchable>(movieId: M1) -> Cuckoo.__DoNotUse<Observable<Movie>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: movieId) { $0 }]
            return manager.verify("execute(movieId: Int) -> Observable<Movie>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class GetMovieDetailsUseCaseStub: GetMovieDetailsUseCase {
    
    override func execute(movieId: Int) -> Observable<Movie> {
        return DefaultValueRegistry.defaultValue(for: (Observable<Movie>).self)
    }
}

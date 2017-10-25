// MARK: - Mocks generated from file: Helix Movie Guide/MovieApi.swift at 2017-10-25 17:17:18 +0000

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
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: MovieApi?

    func spy(on victim: MovieApi) -> Self {
        observed = victim
        return self
    }

    

    

    
     func getMoviesDiscover(page: Int)  -> Observable<[Movie]> {
        
            return cuckoo_manager.call("getMoviesDiscover(page: Int) -> Observable<[Movie]>",
                parameters: (page),
                original: observed.map { o in
                    return { (args) -> Observable<[Movie]> in
                        let (page) = args
                        return o.getMoviesDiscover(page: page)
                    }
                })
        
    }
    
     func getMovieDetails(movieId: Int)  -> Observable<Movie> {
        
            return cuckoo_manager.call("getMovieDetails(movieId: Int) -> Observable<Movie>",
                parameters: (movieId),
                original: observed.map { o in
                    return { (args) -> Observable<Movie> in
                        let (movieId) = args
                        return o.getMovieDetails(movieId: movieId)
                    }
                })
        
    }
    
     func getVideos(movieId: Int)  -> Observable<[Video]> {
        
            return cuckoo_manager.call("getVideos(movieId: Int) -> Observable<[Video]>",
                parameters: (movieId),
                original: observed.map { o in
                    return { (args) -> Observable<[Video]> in
                        let (movieId) = args
                        return o.getVideos(movieId: movieId)
                    }
                })
        
    }
    
     func searchMovie(query: String)  -> Observable<[Movie]> {
        
            return cuckoo_manager.call("searchMovie(query: String) -> Observable<[Movie]>",
                parameters: (query),
                original: observed.map { o in
                    return { (args) -> Observable<[Movie]> in
                        let (query) = args
                        return o.searchMovie(query: query)
                    }
                })
        
    }
    

    struct __StubbingProxy_MovieApi: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func getMoviesDiscover<M1: Cuckoo.Matchable>(page: M1) -> Cuckoo.StubFunction<(Int), Observable<[Movie]>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: page) { $0 }]
            return .init(stub: cuckoo_manager.createStub("getMoviesDiscover(page: Int) -> Observable<[Movie]>", parameterMatchers: matchers))
        }
        
        func getMovieDetails<M1: Cuckoo.Matchable>(movieId: M1) -> Cuckoo.StubFunction<(Int), Observable<Movie>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: movieId) { $0 }]
            return .init(stub: cuckoo_manager.createStub("getMovieDetails(movieId: Int) -> Observable<Movie>", parameterMatchers: matchers))
        }
        
        func getVideos<M1: Cuckoo.Matchable>(movieId: M1) -> Cuckoo.StubFunction<(Int), Observable<[Video]>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: movieId) { $0 }]
            return .init(stub: cuckoo_manager.createStub("getVideos(movieId: Int) -> Observable<[Video]>", parameterMatchers: matchers))
        }
        
        func searchMovie<M1: Cuckoo.Matchable>(query: M1) -> Cuckoo.StubFunction<(String), Observable<[Movie]>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: query) { $0 }]
            return .init(stub: cuckoo_manager.createStub("searchMovie(query: String) -> Observable<[Movie]>", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_MovieApi: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func getMoviesDiscover<M1: Cuckoo.Matchable>(page: M1) -> Cuckoo.__DoNotUse<Observable<[Movie]>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: page) { $0 }]
            return cuckoo_manager.verify("getMoviesDiscover(page: Int) -> Observable<[Movie]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func getMovieDetails<M1: Cuckoo.Matchable>(movieId: M1) -> Cuckoo.__DoNotUse<Observable<Movie>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: movieId) { $0 }]
            return cuckoo_manager.verify("getMovieDetails(movieId: Int) -> Observable<Movie>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func getVideos<M1: Cuckoo.Matchable>(movieId: M1) -> Cuckoo.__DoNotUse<Observable<[Video]>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: movieId) { $0 }]
            return cuckoo_manager.verify("getVideos(movieId: Int) -> Observable<[Video]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func searchMovie<M1: Cuckoo.Matchable>(query: M1) -> Cuckoo.__DoNotUse<Observable<[Movie]>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: query) { $0 }]
            return cuckoo_manager.verify("searchMovie(query: String) -> Observable<[Movie]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class MovieApiStub: MovieApi {
    

    

    
     func getMoviesDiscover(page: Int)  -> Observable<[Movie]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Movie]>.self)
    }
    
     func getMovieDetails(movieId: Int)  -> Observable<Movie> {
        return DefaultValueRegistry.defaultValue(for: Observable<Movie>.self)
    }
    
     func getVideos(movieId: Int)  -> Observable<[Video]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Video]>.self)
    }
    
     func searchMovie(query: String)  -> Observable<[Movie]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Movie]>.self)
    }
    
}




// MARK: - Mocks generated from file: Helix Movie Guide/DetailsView.swift at 2017-10-25 17:17:18 +0000

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
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: DetailsView?

    func spy(on victim: DetailsView) -> Self {
        observed = victim
        return self
    }

    

    

    
     func setItemId(id: Int)  {
        
            return cuckoo_manager.call("setItemId(id: Int)",
                parameters: (id),
                original: observed.map { o in
                    return { (args) in
                        let (id) = args
                         o.setItemId(id: id)
                    }
                })
        
    }
    
     func showError(errorMessage: String)  {
        
            return cuckoo_manager.call("showError(errorMessage: String)",
                parameters: (errorMessage),
                original: observed.map { o in
                    return { (args) in
                        let (errorMessage) = args
                         o.showError(errorMessage: errorMessage)
                    }
                })
        
    }
    
     func showLoading(show: Bool)  {
        
            return cuckoo_manager.call("showLoading(show: Bool)",
                parameters: (show),
                original: observed.map { o in
                    return { (args) in
                        let (show) = args
                         o.showLoading(show: show)
                    }
                })
        
    }
    
     func showMovieDetails(movie: Movie)  {
        
            return cuckoo_manager.call("showMovieDetails(movie: Movie)",
                parameters: (movie),
                original: observed.map { o in
                    return { (args) in
                        let (movie) = args
                         o.showMovieDetails(movie: movie)
                    }
                })
        
    }
    
     func showVideos(videos: [Video])  {
        
            return cuckoo_manager.call("showVideos(videos: [Video])",
                parameters: (videos),
                original: observed.map { o in
                    return { (args) in
                        let (videos) = args
                         o.showVideos(videos: videos)
                    }
                })
        
    }
    

    struct __StubbingProxy_DetailsView: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func setItemId<M1: Cuckoo.Matchable>(id: M1) -> Cuckoo.StubNoReturnFunction<(Int)> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: id) { $0 }]
            return .init(stub: cuckoo_manager.createStub("setItemId(id: Int)", parameterMatchers: matchers))
        }
        
        func showError<M1: Cuckoo.Matchable>(errorMessage: M1) -> Cuckoo.StubNoReturnFunction<(String)> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: errorMessage) { $0 }]
            return .init(stub: cuckoo_manager.createStub("showError(errorMessage: String)", parameterMatchers: matchers))
        }
        
        func showLoading<M1: Cuckoo.Matchable>(show: M1) -> Cuckoo.StubNoReturnFunction<(Bool)> where M1.MatchedType == Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: show) { $0 }]
            return .init(stub: cuckoo_manager.createStub("showLoading(show: Bool)", parameterMatchers: matchers))
        }
        
        func showMovieDetails<M1: Cuckoo.Matchable>(movie: M1) -> Cuckoo.StubNoReturnFunction<(Movie)> where M1.MatchedType == Movie {
            let matchers: [Cuckoo.ParameterMatcher<(Movie)>] = [wrap(matchable: movie) { $0 }]
            return .init(stub: cuckoo_manager.createStub("showMovieDetails(movie: Movie)", parameterMatchers: matchers))
        }
        
        func showVideos<M1: Cuckoo.Matchable>(videos: M1) -> Cuckoo.StubNoReturnFunction<([Video])> where M1.MatchedType == [Video] {
            let matchers: [Cuckoo.ParameterMatcher<([Video])>] = [wrap(matchable: videos) { $0 }]
            return .init(stub: cuckoo_manager.createStub("showVideos(videos: [Video])", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_DetailsView: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func setItemId<M1: Cuckoo.Matchable>(id: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: id) { $0 }]
            return cuckoo_manager.verify("setItemId(id: Int)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func showError<M1: Cuckoo.Matchable>(errorMessage: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: errorMessage) { $0 }]
            return cuckoo_manager.verify("showError(errorMessage: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func showLoading<M1: Cuckoo.Matchable>(show: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: show) { $0 }]
            return cuckoo_manager.verify("showLoading(show: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func showMovieDetails<M1: Cuckoo.Matchable>(movie: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Movie {
            let matchers: [Cuckoo.ParameterMatcher<(Movie)>] = [wrap(matchable: movie) { $0 }]
            return cuckoo_manager.verify("showMovieDetails(movie: Movie)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func showVideos<M1: Cuckoo.Matchable>(videos: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [Video] {
            let matchers: [Cuckoo.ParameterMatcher<([Video])>] = [wrap(matchable: videos) { $0 }]
            return cuckoo_manager.verify("showVideos(videos: [Video])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class DetailsViewStub: DetailsView {
    

    

    
     func setItemId(id: Int)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func showError(errorMessage: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func showLoading(show: Bool)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func showMovieDetails(movie: Movie)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func showVideos(videos: [Video])  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}




// MARK: - Mocks generated from file: Helix Movie Guide/GetMovieVideosUseCase.swift at 2017-10-25 17:17:18 +0000

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
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: GetMovieVideosUseCase?

    func spy(on victim: GetMovieVideosUseCase) -> Self {
        observed = victim
        return self
    }

    

    

    
     override func execute(movieId: Int)  -> Observable<[Video]> {
        
            return cuckoo_manager.call("execute(movieId: Int) -> Observable<[Video]>",
                parameters: (movieId),
                original: observed.map { o in
                    return { (args) -> Observable<[Video]> in
                        let (movieId) = args
                        return o.execute(movieId: movieId)
                    }
                })
        
    }
    

    struct __StubbingProxy_GetMovieVideosUseCase: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func execute<M1: Cuckoo.Matchable>(movieId: M1) -> Cuckoo.StubFunction<(Int), Observable<[Video]>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: movieId) { $0 }]
            return .init(stub: cuckoo_manager.createStub("execute(movieId: Int) -> Observable<[Video]>", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_GetMovieVideosUseCase: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func execute<M1: Cuckoo.Matchable>(movieId: M1) -> Cuckoo.__DoNotUse<Observable<[Video]>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: movieId) { $0 }]
            return cuckoo_manager.verify("execute(movieId: Int) -> Observable<[Video]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class GetMovieVideosUseCaseStub: GetMovieVideosUseCase {
    

    

    
     override func execute(movieId: Int)  -> Observable<[Video]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Video]>.self)
    }
    
}




// MARK: - Mocks generated from file: Helix Movie Guide/HomeView.swift at 2017-10-25 17:17:18 +0000

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
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: HomeView?

    func spy(on victim: HomeView) -> Self {
        observed = victim
        return self
    }

    

    

    
     func showError(errorMessage: String)  {
        
            return cuckoo_manager.call("showError(errorMessage: String)",
                parameters: (errorMessage),
                original: observed.map { o in
                    return { (args) in
                        let (errorMessage) = args
                         o.showError(errorMessage: errorMessage)
                    }
                })
        
    }
    
     func appendData(data: [Movie])  {
        
            return cuckoo_manager.call("appendData(data: [Movie])",
                parameters: (data),
                original: observed.map { o in
                    return { (args) in
                        let (data) = args
                         o.appendData(data: data)
                    }
                })
        
    }
    
     func replaceData(data: [Movie])  {
        
            return cuckoo_manager.call("replaceData(data: [Movie])",
                parameters: (data),
                original: observed.map { o in
                    return { (args) in
                        let (data) = args
                         o.replaceData(data: data)
                    }
                })
        
    }
    

    struct __StubbingProxy_HomeView: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func showError<M1: Cuckoo.Matchable>(errorMessage: M1) -> Cuckoo.StubNoReturnFunction<(String)> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: errorMessage) { $0 }]
            return .init(stub: cuckoo_manager.createStub("showError(errorMessage: String)", parameterMatchers: matchers))
        }
        
        func appendData<M1: Cuckoo.Matchable>(data: M1) -> Cuckoo.StubNoReturnFunction<([Movie])> where M1.MatchedType == [Movie] {
            let matchers: [Cuckoo.ParameterMatcher<([Movie])>] = [wrap(matchable: data) { $0 }]
            return .init(stub: cuckoo_manager.createStub("appendData(data: [Movie])", parameterMatchers: matchers))
        }
        
        func replaceData<M1: Cuckoo.Matchable>(data: M1) -> Cuckoo.StubNoReturnFunction<([Movie])> where M1.MatchedType == [Movie] {
            let matchers: [Cuckoo.ParameterMatcher<([Movie])>] = [wrap(matchable: data) { $0 }]
            return .init(stub: cuckoo_manager.createStub("replaceData(data: [Movie])", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_HomeView: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func showError<M1: Cuckoo.Matchable>(errorMessage: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: errorMessage) { $0 }]
            return cuckoo_manager.verify("showError(errorMessage: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func appendData<M1: Cuckoo.Matchable>(data: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [Movie] {
            let matchers: [Cuckoo.ParameterMatcher<([Movie])>] = [wrap(matchable: data) { $0 }]
            return cuckoo_manager.verify("appendData(data: [Movie])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func replaceData<M1: Cuckoo.Matchable>(data: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [Movie] {
            let matchers: [Cuckoo.ParameterMatcher<([Movie])>] = [wrap(matchable: data) { $0 }]
            return cuckoo_manager.verify("replaceData(data: [Movie])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class HomeViewStub: HomeView {
    

    

    
     func showError(errorMessage: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func appendData(data: [Movie])  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func replaceData(data: [Movie])  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}




// MARK: - Mocks generated from file: Helix Movie Guide/SearchMoviesUseCase.swift at 2017-10-25 17:17:18 +0000

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
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: SearchMoviesUseCase?

    func spy(on victim: SearchMoviesUseCase) -> Self {
        observed = victim
        return self
    }

    

    

    
     override func execute(text: String)  -> Observable<[Movie]> {
        
            return cuckoo_manager.call("execute(text: String) -> Observable<[Movie]>",
                parameters: (text),
                original: observed.map { o in
                    return { (args) -> Observable<[Movie]> in
                        let (text) = args
                        return o.execute(text: text)
                    }
                })
        
    }
    

    struct __StubbingProxy_SearchMoviesUseCase: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func execute<M1: Cuckoo.Matchable>(text: M1) -> Cuckoo.StubFunction<(String), Observable<[Movie]>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: text) { $0 }]
            return .init(stub: cuckoo_manager.createStub("execute(text: String) -> Observable<[Movie]>", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_SearchMoviesUseCase: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func execute<M1: Cuckoo.Matchable>(text: M1) -> Cuckoo.__DoNotUse<Observable<[Movie]>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: text) { $0 }]
            return cuckoo_manager.verify("execute(text: String) -> Observable<[Movie]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class SearchMoviesUseCaseStub: SearchMoviesUseCase {
    

    

    
     override func execute(text: String)  -> Observable<[Movie]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Movie]>.self)
    }
    
}




// MARK: - Mocks generated from file: Helix Movie Guide/GetMoviesDiscoverUseCase.swift at 2017-10-25 17:17:18 +0000

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
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: GetMoviesDiscoverUseCase?

    func spy(on victim: GetMoviesDiscoverUseCase) -> Self {
        observed = victim
        return self
    }

    

    

    
     override func execute(page: Int)  -> Observable<[Movie]> {
        
            return cuckoo_manager.call("execute(page: Int) -> Observable<[Movie]>",
                parameters: (page),
                original: observed.map { o in
                    return { (args) -> Observable<[Movie]> in
                        let (page) = args
                        return o.execute(page: page)
                    }
                })
        
    }
    

    struct __StubbingProxy_GetMoviesDiscoverUseCase: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func execute<M1: Cuckoo.Matchable>(page: M1) -> Cuckoo.StubFunction<(Int), Observable<[Movie]>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: page) { $0 }]
            return .init(stub: cuckoo_manager.createStub("execute(page: Int) -> Observable<[Movie]>", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_GetMoviesDiscoverUseCase: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func execute<M1: Cuckoo.Matchable>(page: M1) -> Cuckoo.__DoNotUse<Observable<[Movie]>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: page) { $0 }]
            return cuckoo_manager.verify("execute(page: Int) -> Observable<[Movie]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class GetMoviesDiscoverUseCaseStub: GetMoviesDiscoverUseCase {
    

    

    
     override func execute(page: Int)  -> Observable<[Movie]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Movie]>.self)
    }
    
}




// MARK: - Mocks generated from file: Helix Movie Guide/GetMovieDetailsUseCase.swift at 2017-10-25 17:17:18 +0000

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
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: GetMovieDetailsUseCase?

    func spy(on victim: GetMovieDetailsUseCase) -> Self {
        observed = victim
        return self
    }

    

    

    
     override func execute(movieId: Int)  -> Observable<Movie> {
        
            return cuckoo_manager.call("execute(movieId: Int) -> Observable<Movie>",
                parameters: (movieId),
                original: observed.map { o in
                    return { (args) -> Observable<Movie> in
                        let (movieId) = args
                        return o.execute(movieId: movieId)
                    }
                })
        
    }
    

    struct __StubbingProxy_GetMovieDetailsUseCase: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func execute<M1: Cuckoo.Matchable>(movieId: M1) -> Cuckoo.StubFunction<(Int), Observable<Movie>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: movieId) { $0 }]
            return .init(stub: cuckoo_manager.createStub("execute(movieId: Int) -> Observable<Movie>", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_GetMovieDetailsUseCase: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func execute<M1: Cuckoo.Matchable>(movieId: M1) -> Cuckoo.__DoNotUse<Observable<Movie>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: movieId) { $0 }]
            return cuckoo_manager.verify("execute(movieId: Int) -> Observable<Movie>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class GetMovieDetailsUseCaseStub: GetMovieDetailsUseCase {
    

    

    
     override func execute(movieId: Int)  -> Observable<Movie> {
        return DefaultValueRegistry.defaultValue(for: Observable<Movie>.self)
    }
    
}




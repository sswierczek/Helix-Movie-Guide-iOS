//
//  AppContainer.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 11/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

import SwinjectStoryboard
// FIXME Figure our scopes
extension SwinjectStoryboard {
    class func setup() {
        defaultContainer.register(MovieApi.self) { resolver in
            return MovieApiClient()
        }

        defaultContainer.register(GetMoviesDiscoverUseCase.self) { resolver in
            let movieApi = resolver.resolve(MovieApi.self)
            return GetMoviesDiscoverUseCase(api: movieApi!)
        }

        defaultContainer.register(SearchMoviesUseCase.self) { resolver in
            let movieApi = resolver.resolve(MovieApi.self)
            return SearchMoviesUseCase(api: movieApi!)
        }

        defaultContainer.register(GetMovieDetailsUseCase.self) { resolver in
            let movieApi = resolver.resolve(MovieApi.self)
            return GetMovieDetailsUseCase(api: movieApi!)
        }

        defaultContainer.register(GetMovieVideosUseCase.self) { resolver in
            let movieApi = resolver.resolve(MovieApi.self)
            return GetMovieVideosUseCase(api: movieApi!)
        }

        defaultContainer.register(HomePresenter.self) { resolver in
            let discoverUseCase = resolver.resolve(GetMoviesDiscoverUseCase.self)
            let searchUseCase = resolver.resolve(SearchMoviesUseCase.self)
            return HomePresenter(moviesDiscoverUseCase: discoverUseCase!,
                                 searchMoviesUseCase: searchUseCase!)
        }

        defaultContainer.register(DetailsPresenter.self) { resolver in
            let movieDetailsUseCase = resolver.resolve(GetMovieDetailsUseCase.self)
            let movieVideosUseCase = resolver.resolve(GetMovieVideosUseCase.self)
            return DetailsPresenter(getMovieDetailsUseCase: movieDetailsUseCase!,
                                    getMovieVideosUseCase: movieVideosUseCase!)
        }

        defaultContainer.storyboardInitCompleted(HomeViewController.self) { resolver, controller in
            controller.presenter = resolver.resolve(HomePresenter.self)
        }

        defaultContainer.storyboardInitCompleted(DetailsController.self) { resolver, controller in
            controller.presenter = resolver.resolve(DetailsPresenter.self)
        }
    }
}

//
//  MovieApiClient.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 09/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

import RxSwift
import RxAlamofire

class MovieApiClient: MovieApi {

    private static let BASE_URL = "http://api.themoviedb.org/3"

    func getMoviesDiscover(page: Int) -> Observable<[Movie]> {
        let url = "\(MovieApiClient.BASE_URL)/discover/movie?api_key=\(Config.API_KEY)&page=\(page)"
        NSLog("GET: \(url)")
        return RxAlamofire
            .requestJSON(.get, url)
            .mapObject(type: MovieResult.self)
            .flatMap({ result in
                return Observable.just(result.results!)
            })
    }

    func getMovieDetails(movieId: Int) -> Observable<Movie> {
        let url = "\(MovieApiClient.BASE_URL)/movie/\(movieId)?api_key=\(Config.API_KEY)"
        NSLog("GET: \(url)")
        return RxAlamofire
            .requestJSON(.get, url)
            .mapObject(type: Movie.self)
    }

    func getVideos(movieId: Int) -> Observable<[Video]> {
        let url = "\(MovieApiClient.BASE_URL)/movie/\(movieId)/videos?api_key=\(Config.API_KEY)"
        NSLog("GET: \(url)")
        return RxAlamofire
            .requestJSON(.get, url)
            .mapObject(type: VideoResult.self)
            .flatMap({ result in
                return Observable.just(result.results!)
            })
    }

    func searchMovie(query: String) -> Observable<[Movie]> {
        let url = "\(MovieApiClient.BASE_URL)/search/movie?api_key=\(Config.API_KEY)&query=\(query)"
        NSLog("GET: \(url)")
        return RxAlamofire
            .requestJSON(.get, url)
            .mapObject(type: MovieResult.self)
            .filter({ result in result.results != nil })
            .flatMap({ result in
                return Observable.just(result.results!)
            })
    }
}

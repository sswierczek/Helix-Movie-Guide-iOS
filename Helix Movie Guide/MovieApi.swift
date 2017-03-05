//
//  MovieApi.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 09/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

import RxSwift

protocol MovieApi: class {

    func getMoviesDiscover(page: Int) -> Observable<[Movie]>

    func getMovieDetails(movieId: Int) -> Observable<Movie>

    func getVideos(movieId: Int) -> Observable<[Video]>
    
    func searchMovie(query: String) -> Observable<[Movie]>

}

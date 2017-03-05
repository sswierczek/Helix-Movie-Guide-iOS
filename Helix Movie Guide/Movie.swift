//
//  Movie.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 07/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

import ObjectMapper

public class Movie: Mappable {
    public var poster_path: String?
    public var adult: String?
    public var overview: String?
    public var release_date: String?
    public var genre_ids: [Int]?
    public var id: Int?
    public var original_title: String?
    public var original_language: String?
    public var title: String?
    public var backdrop_path: String?
    public var popularity: Double?
    public var vote_count: Int?
    public var video: String?
    public var vote_average: Double?


    required public init?(map: Map) {

    }

    public func mapping(map: Map) {
        poster_path <- map["poster_path"]
        adult <- map["adult"]
        overview <- map["overview"]
        release_date <- map["release_date"]
        genre_ids <- map["genre_ids"]
        id <- map["id"]
        original_title <- map["original_title"]
        original_language <- map["original_language"]
        title <- map["title"]
        backdrop_path <- map["backdrop_path"]
        popularity <- map["popularity"]
        vote_count <- map["vote_count"]
        video <- map["video"]
        vote_average <- map["vote_average"]
    }

    public func getFullImagePath() -> String {
        if let poster = poster_path {
            return "https://image.tmdb.org/t/p/w500\(poster)"
        } else {
            return "http://placehold.it/500?text=\(original_title)"
        }
    }
}

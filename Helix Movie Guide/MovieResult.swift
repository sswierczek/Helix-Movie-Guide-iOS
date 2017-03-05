//
//  MovieResult.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 07/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

import ObjectMapper

public class MovieResult: Mappable {
    public var page: Int?
    public var results: [Movie]?
    public var total_results: Int?
    public var total_pages: Int?

    required public init?(map: Map) {

    }

    public func mapping(map: Map) {
        page <- map["page"]
        results <- map["results"]
        total_results <- map["total_results"]
        total_pages <- map["total_pages"]
    }

}

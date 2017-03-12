//
//  VideoResult.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 07/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

import ObjectMapper

class VideoResult: Mappable {
    public var id: Int?
    public var results: [Video]?


    required public init?(map: Map) {

    }

    public func mapping(map: Map) {
        id <- map["id"]
        results <- map["results"]
    }

}

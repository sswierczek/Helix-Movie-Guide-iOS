//
//  Video.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 07/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

import ObjectMapper

class Video: Mappable {

    public var id: String?
    public var iso_639_1: String?
    public var iso_3166_1: String?
    public var key: String?
    public var name: String?
    public var site: String?
    public var size: Int?
    public var type: String?

    required public init?(map: Map) {

    }

    public func mapping(map: Map) {
        id <- map["id"]
        iso_639_1 <- map["iso_639_1"]
        iso_3166_1 <- map["iso_3166_1"]
        key <- map["key"]
        name <- map["name"]
        site <- map["site"]
        size <- map["size"]
        type <- map["type"]
    }

    public func getFullVideoUrl() throws -> String {
        if site == "YouTube" {
            return "https://www.youtube.com/embed/\(key!)"
        } else {
            throw ApiError.unsupportedResource
        }
    }
}

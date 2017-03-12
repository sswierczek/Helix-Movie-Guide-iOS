//
//  VideoResultTest.swift
//  Helix Movie Guide
//
//  Created by Sebastian Swierczek on 12/03/2017.
//  Copyright © 2017 user. All rights reserved.
//
@testable import Helix_Movie_Guide
import XCTest
import ObjectMapper

class VideoResultTest: XCTestCase {

    let videoResult: VideoResult? = VideoResult(map: Map(mappingType: MappingType.fromJSON, JSON: [:]))

    func test_WHEN_mapHasId_THEN_idFieldIsSet() {
        let value = 1
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["id": value])

        videoResult?.mapping(map: map)

        XCTAssertEqual(value, videoResult?.id)
    }

    func test_WHEN_mapHasResults_THEN_resultsFieldIsSet() {
        let emptyVideos: [Video]? = []
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["results": emptyVideos!])

        videoResult?.mapping(map: map)

        XCTAssertEqual(emptyVideos?.count, videoResult?.results?.count)
    }
}

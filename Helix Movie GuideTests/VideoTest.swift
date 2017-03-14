//
//  VideoTest.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 09/02/2017.
//  Copyright © 2017 user. All rights reserved.
//
@testable import Helix_Movie_Guide
import XCTest
import ObjectMapper

class VideoTest: XCTestCase {

    let value = "sampleValue"
    let video: Video? = Video(map: Map(mappingType: MappingType.fromJSON, JSON: [:]))

    override func setUp() {
        super.setUp()
        video?.key = "1234abcd"
    }

    func test_WHEN_siteIsYoutube_THEN_returnYoutubeEmbedUrl() throws {
        video?.site = "YouTube"

        let fullVideoUrl = try video?.getFullVideoUrl()

        XCTAssertEqual("https://www.youtube.com/embed/1234abcd", fullVideoUrl)
    }

    func test_WHEN_siteIsUnknown_THEN_returnEmptyUrl() {
        video?.site = "Unknown"

        XCTAssertThrowsError(try video?.getFullVideoUrl()) { error in
            XCTAssertEqual(error as? ApiError, ApiError.unsupportedResource)
        }
    }

    func test_WHEN_mapHasId_THEN_idFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["id": value])

        video?.mapping(map: map)

        XCTAssertEqual(value, video?.id)
    }

    func test_WHEN_mapHasIso_639_1_THEN_iso_639_1FieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["iso_639_1": value])

        video?.mapping(map: map)

        XCTAssertEqual(value, video?.iso_639_1)
    }

    func test_WHEN_mapHasIso_3166_1_THEN_iso_3166_1FieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["iso_3166_1": value])

        video?.mapping(map: map)

        XCTAssertEqual(value, video?.iso_3166_1)
    }

    func test_WHEN_mapHasName_THEN_nameFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["name": value])

        video?.mapping(map: map)

        XCTAssertEqual(value, video?.name)
    }

    func test_WHEN_mapHasSite_THEN_siteFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["site": value])

        video?.mapping(map: map)

        XCTAssertEqual(value, video?.site)
    }

    func test_WHEN_mapHasSize_THEN_sizeFieldIsSet() {
        let value = 1
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["size": value])

        video?.mapping(map: map)

        XCTAssertEqual(value, video?.size)
    }

    func test_WHEN_mapHasType_THEN_typeFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["type": value])

        video?.mapping(map: map)

        XCTAssertEqual(value, video?.type)
    }
}

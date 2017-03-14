//
//  MovieResultTest.swift
//  Helix Movie Guide
//
//  Created by Sebastian Swierczek on 14/03/2017.
//  Copyright © 2017 user. All rights reserved.
//

@testable import Helix_Movie_Guide
import XCTest
import ObjectMapper

class MovieResultTest: XCTestCase {

    let intValue = 1

    let movieResult: MovieResult? = MovieResult(map: Map(mappingType: MappingType.fromJSON, JSON: [:]))

    func test_WHEN_mapHasPage_THEN_pageFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["page": intValue])

        movieResult?.mapping(map: map)

        XCTAssertEqual(intValue, movieResult?.page)
    }

    func test_WHEN_mapHasResults_THEN_resultsFieldIsSet() {
        let emptyMovies: [Movie]? = []
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["results": emptyMovies!])

        movieResult?.mapping(map: map)

        XCTAssertEqual(emptyMovies?.count, movieResult?.results?.count)
    }

    func test_WHEN_mapHasTotalResults_THEN_totalResultsFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["total_results": intValue])

        movieResult?.mapping(map: map)

        XCTAssertEqual(intValue, movieResult?.total_results)
    }

    func test_WHEN_mapHasTotalPages_THEN_totalPagesFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["total_pages": intValue])

        movieResult?.mapping(map: map)

        XCTAssertEqual(intValue, movieResult?.total_pages)
    }
}

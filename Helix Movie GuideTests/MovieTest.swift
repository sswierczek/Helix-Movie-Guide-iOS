//
//  MovieTest.swift
//  Helix Movie Guide
//
//  Created by Sebastian Swierczek on 14/03/2017.
//  Copyright © 2017 user. All rights reserved.
//
@testable import Helix_Movie_Guide
import XCTest
import ObjectMapper

class MovieTest: XCTestCase {

    let value = "sampleValue"
    let intValue = 1
    let doubleValue = Double(1)

    let movie: Movie? = Movie(map: Map(mappingType: MappingType.fromJSON, JSON: [:]))

    override func setUp() {
        super.setUp()
    }

    func test_WHEN_posterPathExists_THEN_returnPathToTmdb() {
        movie?.poster_path = "/samplePath"

        let fullImagePathvie = movie?.getFullImagePath()

        XCTAssertEqual("https://image.tmdb.org/t/p/w500/samplePath", fullImagePathvie)
    }

    func test_WHEN_posterPathDoesntExist_THEN_returnPlaceHoldItUrl() {
        movie?.poster_path = nil
        movie?.original_title = "Movie 1234"

        let fullImagePathvie = movie?.getFullImagePath()

        XCTAssertEqual("http://placehold.it/500?text=\(movie?.original_title)", fullImagePathvie)
    }

    func test_WHEN_mapHasPosterPath_THEN_posterPathFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["poster_path": value])

        movie?.mapping(map: map)

        XCTAssertEqual(value, movie?.poster_path)
    }

    func test_WHEN_mapHasAdult_THEN_adultFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["adult": value])

        movie?.mapping(map: map)

        XCTAssertEqual(value, movie?.adult)
    }

    func test_WHEN_mapHasOverview_THEN_overviewFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["overview": value])

        movie?.mapping(map: map)

        XCTAssertEqual(value, movie?.overview)
    }

    func test_WHEN_mapHasReleaseDate_THEN_releaseDateFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["release_date": value])

        movie?.mapping(map: map)

        XCTAssertEqual(value, movie?.release_date)
    }

    func test_WHEN_mapHasGenreIds_THEN_genreIdsFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["genre_ids": [intValue]])

        movie?.mapping(map: map)

        XCTAssertEqual(intValue, movie?.genre_ids?[0])
    }

    func test_WHEN_mapHasId_THEN_idFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["id": intValue])

        movie?.mapping(map: map)

        XCTAssertEqual(intValue, movie?.id)
    }

    func test_WHEN_mapHasOriginalTitle_THEN_originalTitleFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["original_title": value])

        movie?.mapping(map: map)

        XCTAssertEqual(value, movie?.original_title)
    }

    func test_WHEN_mapHasOriginalLanguage_THEN_originalLanguageFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["original_language": value])

        movie?.mapping(map: map)

        XCTAssertEqual(value, movie?.original_language)
    }

    func test_WHEN_mapHasTitle_THEN_titleFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["title": value])

        movie?.mapping(map: map)

        XCTAssertEqual(value, movie?.title)
    }

    func test_WHEN_mapHasBackdropPath_THEN_backdropPathFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["backdrop_path": value])

        movie?.mapping(map: map)

        XCTAssertEqual(value, movie?.backdrop_path)
    }

    func test_WHEN_mapHasPopularity_THEN_popularityFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["popularity": doubleValue])

        movie?.mapping(map: map)

        XCTAssertEqual(doubleValue, movie?.popularity)
    }

    func test_WHEN_mapHasVoteCount_THEN_voteCountFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["vote_count": intValue])

        movie?.mapping(map: map)

        XCTAssertEqual(intValue, movie?.vote_count)
    }

    func test_WHEN_mapHasVideo_THEN_videoFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["video": value])

        movie?.mapping(map: map)

        XCTAssertEqual(value, movie?.video)
    }

    func test_WHEN_mapHasVoteAverage_THEN_voteAverageFieldIsSet() {
        let map = Map(mappingType: MappingType.fromJSON, JSON: ["vote_average": doubleValue])

        movie?.mapping(map: map)

        XCTAssertEqual(doubleValue, movie?.vote_average)
    }
}

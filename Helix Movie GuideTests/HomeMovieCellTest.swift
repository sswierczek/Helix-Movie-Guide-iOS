//
//  HomeMovieCellTest.swift
//  Helix Movie Guide
//
//  Created by Sebastian Swierczek on 16/03/2017.
//  Copyright © 2017 user. All rights reserved.
//


@testable import Helix_Movie_Guide
import XCTest
import ObjectMapper

class HomeMovieCellTest: XCTestCase {

    let movie: Movie? = Movie(map: Map(mappingType: MappingType.fromJSON, JSON: [:]))

    var homeMovieCell = HackedHomeMovieCell()

    func test_WHEN_bindMovie_THEN_setLabelText() {
        movie?.original_title = "Title"

        homeMovieCell.bindMovie(movie: movie!)

        XCTAssertEqual("Title", homeMovieCell.label?.text)
    }

    func test_WHEN_bindMovie_THEN_loadImage() {
        movie?.poster_path = "/image_path"

        homeMovieCell.bindMovie(movie: movie!)

        XCTAssertEqual(URL(string: (movie?.getFullImagePath())!), homeMovieCell.imageView?.sd_imageURL())
    }

    // Hack to avoid weak variable being recycled
    class HackedHomeMovieCell: HomeMovieCell {
        let stubbedLabel: UILabel! = UILabel()
        let stubbedImageView: UIImageView! = UIImageView()

        override var label: UILabel! {
            get {
                return stubbedLabel
            }
            set { }
        }
        override var imageView: UIImageView! {
            get {
                return stubbedImageView
            }
            set { }
        }
    }
}

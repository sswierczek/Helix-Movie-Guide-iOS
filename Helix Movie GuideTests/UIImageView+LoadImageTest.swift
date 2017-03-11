//
//  UIImageView+LoadImageTest.swift
//  Helix Movie Guide
//
//  Created by Sebastian Swierczek on 11/03/2017.
//  Copyright © 2017 user. All rights reserved.
//

@testable import Helix_Movie_Guide
import XCTest
import ObjectMapper

class UIImageViewExtensionLoadImageTest: XCTestCase {

    var imageView: UIImageView?

    override func setUp() {
        imageView = UIImageView()
    }

    func test_WHEN_loadImage_THEN_loadWithGivenPath() {
        let path = "http://example.jpg"

        imageView?.loadImage(path: path)

        XCTAssertTrue(URL(string: path) == imageView?.sd_imageURL())
    }
}

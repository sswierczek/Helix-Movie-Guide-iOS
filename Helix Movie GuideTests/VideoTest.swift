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

    let video: Video = Video()

    override func setUp() {
        super.setUp()
        video.key = "1234abcd"
    }

    func test_WHEN_site_is_youtube_THEN_return_youtube_embed_url() {
        video.site = "YouTube"

        let fullVideoUrl = video.getFullVideoUrl()

        XCTAssert(fullVideoUrl == "https://www.youtube.com/embed/1234abcd")
    }
    
    func test_WHEN_site_is_unknown_THEN_return_empty_url() {
        video.site = "Unknown"
        
        let fullVideoUrl = video.getFullVideoUrl()
        
        XCTAssert(fullVideoUrl == "")
    }
}

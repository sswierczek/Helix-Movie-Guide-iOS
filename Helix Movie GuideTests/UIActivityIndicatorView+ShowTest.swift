//
//  UIActivityIndicatorView+ShowTest.swift
//  Helix Movie Guide
//
//  Created by Sebastian Swierczek on 08/03/2017.
//  Copyright © 2017 user. All rights reserved.
//

@testable import Helix_Movie_Guide
import XCTest

class UIActivityIndicatorViewsExtensionsTest: XCTestCase {

    var loadingIndicator: UIActivityIndicatorView?

    override func setUp() {
        loadingIndicator = UIActivityIndicatorView()
    }

    func test_WHEN_startAnimationTrue_THEN_startAnimating() {
        loadingIndicator?.startAnimating(start: true)

        XCTAssert(loadingIndicator?.isAnimating == true)
    }

    func test_WHEN_startAnimationFalse_THEN_stopAnimating() {
        loadingIndicator?.startAnimating(start: false)

        XCTAssert(loadingIndicator?.isAnimating == false)
    }
}

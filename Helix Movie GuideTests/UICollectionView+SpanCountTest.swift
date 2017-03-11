//
//  UICollectionView+SpanCountTest.swift
//  Helix Movie Guide
//
//  Created by Sebastian Swierczek on 11/03/2017.
//  Copyright © 2017 user. All rights reserved.
//

@testable import Helix_Movie_Guide
import XCTest
import ObjectMapper

// FIXME Add precondition testing when it will be possible in Swift
class UICollectionViewExtensionSpanCountTest: XCTestCase {

    let ACCURANCY = 0.1
    let COLLECTION_VIEW_SIZE = 100
    let OK_SPAN_COUNT = 1

    var collectionView: UICollectionView?
    var flowLayout: UICollectionViewFlowLayout?

    override func setUp() {
        flowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: CGRect(origin: CGPoint(), size: CGSize(width: COLLECTION_VIEW_SIZE, height: COLLECTION_VIEW_SIZE)), collectionViewLayout: flowLayout!)
    }

    func test_GIVEN_landscapeOrientation_WHEN_spanCountGreaterThanZero_THEN_itemWidthIsSetToDividedFrameWidth() {
        setOrientation(value: UIInterfaceOrientation.landscapeLeft.rawValue)
        let testedSpanCount = 4

        collectionView?.setSpanCount(portrait: OK_SPAN_COUNT, landscape: testedSpanCount)

        let expectedSize = (collectionView?.frame.width)! * CGFloat(Float(1) / Float(testedSpanCount))
        XCTAssertEqual(flowLayout?.itemSize.width, expectedSize)
        XCTAssertEqual(flowLayout?.itemSize.height, expectedSize)
    }

    func test_GIVEN_portraitOrientation_WHEN_spanCountGreaterThanZero_THEN_itemWidthIsSetToDividedFrameWidth() {
        setOrientation(value: UIInterfaceOrientation.portrait.rawValue)
        let testedSpanCount = 4

        collectionView?.setSpanCount(portrait: testedSpanCount, landscape: OK_SPAN_COUNT)

        let expectedSize = (collectionView?.frame.width)! * CGFloat(Float(1) / Float(testedSpanCount))
        XCTAssertEqual(flowLayout?.itemSize.width, expectedSize)
        XCTAssertEqual(flowLayout?.itemSize.height, expectedSize)
    }

    func setOrientation(value: Any?) {
        UIDevice.current.setValue(value, forKey: "orientation")
    }
}

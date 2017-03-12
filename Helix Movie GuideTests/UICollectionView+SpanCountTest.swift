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

    let ACCURACY = CGFloat(0.1)
    let COLLECTION_VIEW_SIZE = 100
    let OK_SPAN_COUNT = 1

    var collectionView: UICollectionView?
    var flowLayout: UICollectionViewFlowLayout?

    override func setUp() {
        flowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: CGRect(origin: CGPoint(), size: CGSize(width: COLLECTION_VIEW_SIZE, height: COLLECTION_VIEW_SIZE)), collectionViewLayout: flowLayout!)
    }

    func test_GIVEN_landscapeOrientation_WHEN_spanCountGreaterThanZero_THEN_itemWidthIsSetToDividedFrameWidth() {
        setOrientation(orientation: UIDeviceOrientation.landscapeLeft)
        let testedSpanCount = 4

        collectionView?.setSpanCount(portrait: OK_SPAN_COUNT, landscape: testedSpanCount)

        let expectedSize = Float((collectionView?.frame.width)! * CGFloat(Float(1) / Float(testedSpanCount)))
        XCTAssertEqualWithAccuracy(Float((flowLayout?.itemSize.width)!), expectedSize, accuracy: FLT_EPSILON)
        XCTAssertEqualWithAccuracy(Float((flowLayout?.itemSize.height)!), expectedSize, accuracy: FLT_EPSILON)
    }

    func test_GIVEN_portraitOrientation_WHEN_spanCountGreaterThanZero_THEN_itemWidthIsSetToDividedFrameWidth() {
        setOrientation(orientation: UIDeviceOrientation.portrait)
        let testedSpanCount = 4

        collectionView?.setSpanCount(portrait: testedSpanCount, landscape: OK_SPAN_COUNT)

        let expectedSize = Float((collectionView?.frame.width)! * CGFloat(Float(1) / Float(testedSpanCount)))
        XCTAssertEqualWithAccuracy(Float((flowLayout?.itemSize.width)!), expectedSize, accuracy: FLT_EPSILON)
        XCTAssertEqualWithAccuracy(Float((flowLayout?.itemSize.height)!), expectedSize, accuracy: FLT_EPSILON)
    }

    func test_WHEN_layoutIsNotFloatLayout_THEN_doNotChangeItemDefaultSizes() {
        collectionView?.collectionViewLayout = UICollectionViewLayout()

        collectionView?.setSpanCount(portrait: OK_SPAN_COUNT, landscape: OK_SPAN_COUNT)

        let defaultSize = Float(COLLECTION_VIEW_SIZE / 2)
        XCTAssertEqualWithAccuracy(Float((flowLayout?.itemSize.width)!), defaultSize, accuracy: FLT_EPSILON)
        XCTAssertEqualWithAccuracy(Float((flowLayout?.itemSize.height)!), defaultSize, accuracy: FLT_EPSILON)
    }

    func setOrientation(orientation: UIDeviceOrientation) {
        UIDevice.current.setValue(orientation.rawValue, forKey: "orientation")
        while UIDevice.current.orientation != orientation {
            sleep(100) // FIXME find a better way to wait for orientation change
        }
    }
}

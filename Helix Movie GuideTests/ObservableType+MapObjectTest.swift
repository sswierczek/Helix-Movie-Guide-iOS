//
//  ObservableType+MapObjectTest.swift
//  Helix Movie Guide
//
//  Created by Sebastian Swierczek on 22/03/2017.
//  Copyright © 2017 user. All rights reserved.
//

@testable import Helix_Movie_Guide
import XCTest
import RxSwift
import RxBlocking
import RxAlamofire
import ObjectMapper

public class FakeObject: Mappable {
    public var id: String?
    public var title: String?

    public required init?(map: Map) {
    }

    public func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
    }
}
class ObservableTypeExtensionsMapObjectTest: XCTestCase {

    var observable: Observable<(HTTPURLResponse, Any)>?

    var invalidObservable: Observable<(HTTPURLResponse, Any)>?

    override func setUp() {
        let response = HTTPURLResponse(url: URL(string: "http://www.example.com")!,
                                       statusCode: 200, httpVersion: "HTTP/1.1", headerFields: [:])!

        let fakeObject = FakeObject(JSONString: "{\"id\":\"1234\", \"title\": \"Sample title\"}")
        observable = Observable.just((response, fakeObject?.toJSON() as Any))

        let invalidObject = FakeObject(JSONString: "{invaidJson}")
        invalidObservable = Observable.just((response, invalidObject?.toJSON() as Any))
    }

    func test_WHEN_mapJsonToObject_THEN_returnsObservableWithGivenObject() throws {
        let mappedObject = try observable?.mapObject(type: FakeObject.self).toBlocking().single()

        XCTAssertEqual("1234", mappedObject?.id)
        XCTAssertEqual("Sample title", mappedObject?.title)
    }

    func test_WHEN_mapInvalidObject_THEN_throwsException() throws {
        let mappedObservable = invalidObservable?.mapObject(type: FakeObject.self)

        XCTAssertThrowsError(try mappedObservable?.toBlocking().single()) { error in
            XCTAssertEqual(error as? MappingError, MappingError.cannotParse)
        }
    }
}

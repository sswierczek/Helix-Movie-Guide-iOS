//
//  ObservableTypeExtensions.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 09/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

import RxSwift
import RxAlamofire
import ObjectMapper

extension ObservableType {
    public func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        return flatMap { data -> Observable<T> in
            let (_, json) = (data as? (HTTPURLResponse, Any))!
            guard let object = Mapper<T>().map(JSONObject: json) else {
                throw MappingError.cannotParse
            }
            return Observable.just(object)
        }
    }
}

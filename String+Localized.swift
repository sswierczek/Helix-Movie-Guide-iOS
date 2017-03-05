//
//  StringsExtensions.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 04/02/2017.
//  Copyright © 2017 user. All rights reserved.
//
import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

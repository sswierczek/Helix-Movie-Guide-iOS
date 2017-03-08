//
//  UIActivityIndicator+Show.swift
//  Helix Movie Guide
//
//  Created by Sebastian Swierczek on 08/03/2017.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {
    func startAnimating(start: Bool) {
        if start {
            startAnimating()
        } else {
            stopAnimating()
        }
    }
}

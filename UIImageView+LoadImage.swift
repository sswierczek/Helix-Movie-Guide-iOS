//
//  ImageViewExtensions.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 05/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    func loadImage(path: String?) {
        self.sd_setImage(with: URL(string: path!), placeholderImage: UIImage(named: "placeholder.png"))
    }
}

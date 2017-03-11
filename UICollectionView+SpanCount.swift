//
//  UICollectionViewController+ItemSize.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 12/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

extension UICollectionView {
    func setSpanCount(portrait: Int, landscape: Int) {
        precondition(portrait > 0, "Portrait span count must grater than 0")
        precondition(landscape > 0, "Landscape span count must grater than 0")

        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }

        let isLandscape = UIInterfaceOrientationIsLandscape(UIApplication.shared.statusBarOrientation)
        let itemSize = frame.width * CGFloat(Float(1) / Float(isLandscape ? landscape : portrait))
        flowLayout.itemSize = CGSize(width: itemSize, height: itemSize)
    }
}

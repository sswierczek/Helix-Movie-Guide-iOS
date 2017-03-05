//
//  UIViewControllerExtensions.swift
//  Movie Guide
//
//  Created by Sebastian Swierczek on 12/02/2017.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

extension UIViewController {

    func showSimpleErrorAlert(title: String, body: String) {
        let alertController = UIAlertController(title: title, message: body, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "simple_error_action_button_text".localized, style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
}

//
//  MainView.swift
//  Movie Guide
//
//  Created by user on 27/01/2017.
//  Copyright © 2017 user. All rights reserved.
//

protocol HomeView: class {
    func showError(errorMessage: String)
    func appendData(data: [Movie])
    func replaceData(data: [Movie])
}

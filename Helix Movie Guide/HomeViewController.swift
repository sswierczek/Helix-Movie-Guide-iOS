//
//  ViewController.swift
//  Movie Guide
//
//  Created by user on 23/01/2017.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UISearchBarDelegate {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    lazy var searchBar: UISearchBar = UISearchBar()

    var movies: [Movie] = [Movie]()

    // MARK: Injected
    var presenter: HomePresenter?

    override func viewDidLoad() {
        navigationItem.titleView = searchBar
        searchBar.searchBarStyle = UISearchBarStyle.minimal
        searchBar.delegate = self
        searchBar.placeholder = "discover_search_hint".localized
    }

    override func viewDidAppear(_ animated: Bool) {
        presenter?.attachView(view: self)
    }

    override func viewDidDisappear(_ animated: Bool) {
        presenter?.detachView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailsMovie" {
            let selectedItem = movies[(collectionView?.indexPathsForSelectedItems?[0].row)!]
            let destination = segue.destination as! DetailsView
            destination.setItemId(id: selectedItem.id!)
        }
    }

    // MARK: UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchTextChanged(text: searchText)
    }

    // MARK: UICollectionView
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView?.setSpanCount(portrait: 2, landscape: 4)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count + 1 // + 1 for activity indicator
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.item < movies.count) {
            let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! HomeMovieCell
            movieCell.bindMovie(movie: movies[indexPath.row])
            return movieCell
        } else {
            let indicatorCell = collectionView.dequeueReusableCell(withReuseIdentifier: "IndicatorCell", for: indexPath) as! HomeIndicatorCell
            indicatorCell.indicator.startAnimating()
            return indicatorCell
        }
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offsetY > contentHeight - scrollView.frame.size.height {
            presenter?.scrolledToBottom()
        }
    }
}

// MARK: HomeView
extension HomeViewController: HomeView {

    func showError(errorMessage: String) {
        showSimpleErrorAlert(title: "feed_fetch_error".localized, body: errorMessage)
    }

    func replaceData(data: [Movie]) {
        self.movies.removeAll()
        self.movies.append(contentsOf: data)
        self.collectionView?.reloadData()
        self.collectionView?.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
    }

    func appendData(data: [Movie]) {
        self.movies.append(contentsOf: data)
        self.collectionView?.reloadData()
    }
}

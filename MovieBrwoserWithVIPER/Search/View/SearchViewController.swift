//
//  SearchViewController.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 15/06/20.
//  Copyright (c) 2020 Tushar. All rights reserved.
//

import UIKit

/// Search view.
final class SearchViewController: UIViewController, SearchView {
    
    // MARK: - Properties
    var dependencyManager: DependencyManager!
    
    /// Interactor.
    var interactor: SearchViewOutput!
    
    /// Router.
    var router: SearchRouter!
    
    /// DataSource of collection view.
    let dataSource: SearchMoviesCollectionViewDataSource
    
    /// Delegate of collection view.
    let dataDelegate: SearchMoviesCollectionViewDelegate
    
    var currentPage: Int = 1
    
    var testPage: Int = 0
    
    /// How far scrolling down the view should trigger pagination.
    /// For example, provided 2 will trigger pagination once
    /// the view is scrolled beyond twice the view height.
    private let paginationOffset: CGFloat = 2
    
    /// The movie list collection view.
    @IBOutlet private weak var collectionView: UICollectionView!
    
    /// The movie search bar
    @IBOutlet private weak var searchBar: UISearchBar!
    
    var collecctionFlowLayout: UICollectionViewFlowLayout {
        return (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)!
    }
    
    required init?(coder aDecoder: NSCoder) {
        dataSource = SearchMoviesCollectionViewDataSource()
        dataDelegate = SearchMoviesCollectionViewDelegate()
        
        super.init(coder: aDecoder)
    }
    
    // MARK: View life-cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        router.navigationController = navigationController
        setupViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func setupViewController() {
        setUpCollectionCell()
        collectionView.dataSource = dataSource
        collectionView.delegate = dataDelegate
        dataDelegate.delegate = self
        dataDelegate.interactionDelegate = self
        searchBar.delegate = self
        
        collecctionFlowLayout.scrollDirection = .vertical
        collecctionFlowLayout.minimumLineSpacing = 0
        collecctionFlowLayout.minimumInteritemSpacing = 0
        
        navigationController?.navigationBar.topItem?.title = ""
        self.title = "Search Movie's"
    }
    
    /// Set up collection view.
    private func setUpCollectionCell() {
        registerCell()
    }
    
    /// Reigster collection view cell.
    private func registerCell() {
        collectionView.rigsterCellFromNib(cellIdentifer: "MovieCollectionViewCell")
    }
    
    /// Scroll collectionview return true or false for paggination
    private func hasScrlolledEnoughTriggerPaggination() -> Bool {
        let scrollHeight = collectionView.contentSize.height
        let currenScrollOffset = collectionView.contentOffset.y
        let viewHeight = collectionView.frame.size.height
        return currenScrollOffset > 0 && scrollHeight - currenScrollOffset < paginationOffset * viewHeight
    }
    
    
    func updateSearchMovieList(movies: [MovieDispalyModel], page: Int) {
        self.dataSource.movieDataSource = movies
        self.dataDelegate.movieDataSource = movies
        
        if page > self.currentPage {
            self.currentPage = page
        }
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    // MARK: SearchView Conformance
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView == collectionView else {
            return
        }
        
        if hasScrlolledEnoughTriggerPaggination() {
            if let searchString = searchBar.text {
                
                if currentPage > testPage {
                    interactor.loadMovieWithSearchString(searchString: searchString, page: self.currentPage)
                    testPage = currentPage
                }
            }
        }
    }
}


extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let searchString  = searchBar.text, searchString.count > 3 {
            print(searchString)
            collectionView.reloadData()
            interactor.loadMovieWithSearchString(searchString: searchString, page: currentPage)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.clearAll()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.clearAll()
            }
        }
    }
    
    func clearAll() {
        searchBar.resignFirstResponder()
        self.dataSource.movieDataSource.removeAll()
        self.dataDelegate.movieDataSource.removeAll()
        self.collectionView.reloadData()
        self.currentPage = 1
        self.testPage = 0
        //searchBar.text = ""
    }
}


extension SearchViewController: MovieInteractionDelegate {
    func tappedOnMovieCell(_ movie: MovieDispalyModel) {
        router.routeToMovieDetial(movie:movie)
    }
}

//
//  MovieListViewController.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 16/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import UIKit
import Alamofire

/// Movie list view
final class MovieListViewController: UIViewController, MovieListView {
    
    // MARK: - Properties
    var dependencyManager: DependencyManager!
    
    /// Movie Router
    var router: MovieRouter!
    
    /// DataSource of collection view.
    let dataSource: MovieListCollectionViewDataSource
    
    /// Delegate of collection view.
    let dataDelegate: MovieListCollectionViewDelegate
    
    /// Interactor of movie 
    var interactor: MovieViewOutput!
    
    var currentPage: Int = 1
    
    /// How far scrolling down the view should trigger pagination.
    /// For example, provided 2 will trigger pagination once
    /// the view is scrolled beyond twice the view height.
    private let paginationOffset: CGFloat = 2
    
    
    /// The movie list collection view.
    @IBOutlet private weak var collectionView: UICollectionView!
    
    /// Collection view flow layout.
    var collectionViewFlowLayout: UICollectionViewFlowLayout {
        return (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)!
    }
        
    required init?(coder aDecoder: NSCoder) {
        dataSource = MovieListCollectionViewDataSource()
        dataDelegate = MovieListCollectionViewDelegate()
        
        super.init(coder: aDecoder)
    }
    
    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewController()
        callMovieService(page: currentPage)
    }
    
    
    // MARK: - Private Methods
    
    /// Set up view controller data members.
    func setupViewController() {
        setUpCollectionCell()
        collectionView.dataSource = dataSource
        collectionView.delegate = dataDelegate
        dataDelegate.delegate = self
        dataDelegate.interactionDelegate = self
        router.navigationController = navigationController
        
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.minimumLineSpacing = 0
        collectionViewFlowLayout.minimumInteritemSpacing = 0
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        if #available(iOS 11.0, *) {
            //To change iOS 11 navigationBar largeTitle color

            UINavigationBar.appearance().prefersLargeTitles = true
            UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        } else {
            // for default navigation bar title color
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        }

    }
    
    /// Set up collection view.
    private func setUpCollectionCell() {
        registerCell()
    }
    
    /// Reigster collection view cell.
    private func registerCell() {
        collectionView.rigsterCellFromNib(cellIdentifer: "MovieCollectionViewCell")
    }
    
    /// Call movie list service
    private func callMovieService(page: Int) {
        interactor.loadMovie(page: page)
    }
    
    /// Scroll collectionview return true or false for paggination
    private func hasScrlolledEnoughTriggerPaggination() -> Bool {
        let scrollHeight = collectionView.contentSize.height
        let currenScrollOffset = collectionView.contentOffset.y
        let viewHeight = collectionView.frame.size.height
        return currenScrollOffset > 0 && scrollHeight - currenScrollOffset < paginationOffset * viewHeight
    }
    
    
    // MARK:- Delegate methode of MovieListView
    
    func updateMovieList(movies: [MovieDispalyModel], page: Int) {
        self.dataSource.movieDataSource = movies
        self.dataDelegate.movieDataSource = movies
        
        if page > self.currentPage {
            self.currentPage = page
        }
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)  {
        guard scrollView == collectionView else {
            return
        }
        
        if hasScrlolledEnoughTriggerPaggination() {
            interactor.loadMovie(page: self.currentPage)
        }
    }
}

extension MovieListViewController: MovieInteractionDelegate {
    func tappedOnMovieCell(_ movie: MovieDispalyModel) {
        router.routeToMovieDetial(movie: movie)
    }
}

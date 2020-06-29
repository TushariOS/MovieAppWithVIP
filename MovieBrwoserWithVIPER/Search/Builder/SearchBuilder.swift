//
//  SearchBuilder.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 15/06/20.
//  Copyright © 2020 Tushar. All rights reserved.
//

import Foundation
import UIKit

class SearchBuilder: SearchBuildable {
    
    
    /// DependencyManager
    let dependencyManager: DependencyManager
    
    // MARK: - Init/Deinit

    /// Init function
    /// - Parameter dependancyManger: Dependancy Manger object
    init(dependencyManager: DependencyManager) {
        self.dependencyManager = dependencyManager
    }
    
    func searchViewBuild() -> UIViewController {
        let view = buildView()
        let interactor = buildInteractor()
        let presnter = buildPrenter()
        let router = buildRouter()
        
        view.interactor = interactor
        interactor.presenter = presnter
        presnter.view = view
        view.router = router
        return view
    }
    
    private func buildView() -> SearchViewController {
     let storyBoard = UIStoryboard(name: "Main", bundle:Bundle.main)
        let searchViewController = storyBoard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        return searchViewController
    }
    
    private func buildInteractor() -> SearchInteractor {
        let serviceManager = dependencyManager.requestManager()
        let interactor = SearchInteractor(service: serviceManager)
        return interactor
    }
    
    private func buildPrenter() -> SearchPresenter {
    
        return SearchPresenter()
    }
    
    private func buildRouter() -> SearchRouter {
         let router = SearchRouter(dependencyManager: dependencyManager)
         return router
     }
}

//
//  AppDelegate.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 16/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    /// The app main window.
    var window: UIWindow?

    /// The app dependency manager.
    private var dependencyManager: DependencyManager!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        startApp()

        return true
    }

    // MARK: -  Private functions

    /// App is start from satrt app function.
    private func startApp() {
        setupDependencyManager()
        setUpRootView()
    }

    /// Setup dependency manager.
    private func setupDependencyManager() {
        guard self.dependencyManager == nil else {
            return
        }

        let dependencyManager = MovieDependencyManager.shared
        dependencyManager.startService()
        self.dependencyManager = dependencyManager
    }

    private func setUpRootView() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let builder = dependencyManager.movieListBuilder()
        let vc = builder.build()

        let navigationController = UINavigationController(rootViewController: vc)
        if let window = window {
            window.rootViewController = navigationController
        }
        self.window?.makeKeyAndVisible()
    }
}

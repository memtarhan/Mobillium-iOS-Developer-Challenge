//
//  AppDelegate.swift
//  Mobillium Movie
//
//  Created by Mehmet Tarhan on 20.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Swinject
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var assembler: Assembler?

    var rootViewController: UIViewController? {
        get { return window?.rootViewController }
        set {
            window?.rootViewController = newValue
            window?.makeKeyAndVisible()
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        initWindow()
        initDI()
        initUI()
        initNavigationBar()

        return true
    }

    /// - Initializing window
    private func initWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
    }

    /// - Initializing dependency injection
    private func initDI() {
        assembler = Assembler([
            ListAssembly(),
            SearchAssembly(),
        ])
        assembler?.apply(assembly: ViewControllerAssembly(assembler: assembler!))
    }

    /// - Initializing UI w/ initial view controller
    func initUI() {
        guard let initialViewController = assembler?.resolver.resolve(SearchViewController.self)! as? UIViewController else { return }
        let navigationController = UINavigationController(rootViewController: initialViewController)
        rootViewController = navigationController
    }

    /// - Initializing UINavigationBar
    private func initNavigationBar() {
        let appearance = UINavigationBar.appearance()
        appearance.shadowImage = UIImage()
        appearance.setBackgroundImage(UIImage(), for: .default)
        appearance.barTintColor = .clear
        appearance.prefersLargeTitles = true

        /// - Back indicator
        appearance.backIndicatorImage = UIImage()
        appearance.backIndicatorTransitionMaskImage = UIImage()
        var backButtonImage = UIImage(named: "back-button-indicator")
        backButtonImage = backButtonImage?.stretchableImage(withLeftCapWidth: 20, topCapHeight: 30)
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(backButtonImage, for: .normal, barMetrics: .default)
    }
}

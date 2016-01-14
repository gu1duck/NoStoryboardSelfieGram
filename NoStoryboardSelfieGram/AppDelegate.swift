//
//  AppDelegate.swift
//  NoStoryboardSelfieGram
//
//  Created by Jeremy Petter on 2016-01-13.
//  Copyright © 2016 Jeremy Petter. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let tabBarController = UITabBarController()

    let feedNavigationController = UINavigationController()
    let activitiesNavigationController = UINavigationController()
    let profileNavigationController = UINavigationController()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow()
        window!.makeKeyAndVisible()

        feedNavigationController.viewControllers = [UITableViewController()]
        feedNavigationController.navigationBar.barTintColor = UIColor.purpleColor()
        feedNavigationController.navigationBar.translucent = false
        feedNavigationController.tabBarItem.title = "Feed"
        feedNavigationController.tabBarItem.image = UIImage(named: "NewsFeed")

        activitiesNavigationController.viewControllers = [UITableViewController()]
        activitiesNavigationController.navigationBar.barTintColor = UIColor.purpleColor()
        activitiesNavigationController.navigationBar.translucent = false
        activitiesNavigationController.tabBarItem.title = "Activities"
        activitiesNavigationController.tabBarItem.image = UIImage(named: "Activities")

        profileNavigationController.viewControllers = [ProfileViewController()]
        profileNavigationController.navigationBar.barTintColor = UIColor.purpleColor()
        profileNavigationController.navigationBar.translucent = false
        profileNavigationController.tabBarItem.title = "Profile"
        profileNavigationController.tabBarItem.image = UIImage(named: "Profile")

        tabBarController.viewControllers = [
            feedNavigationController,
            activitiesNavigationController,
            profileNavigationController
        ]
        tabBarController.tabBar.translucent = false
        tabBarController.tabBar.barTintColor = UIColor.purpleColor()
        tabBarController.tabBar.tintColor = UIColor.whiteColor()

        window!.rootViewController = tabBarController
        return true
    }
}
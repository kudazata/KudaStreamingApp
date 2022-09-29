//
//  TabBarViewController.swift
//  StreamingApp
//
//  Created by Kuda Zata on 24/6/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .white
        tabBar.barTintColor = .black
        setupVCs()
    }
    
    private func setupVCs() {
        
        let eventsVC = UIStoryboard(name: "Events", bundle: nil).instantiateViewController(withIdentifier: "eventsVC") as! EventsListViewController
        eventsVC.eventsNetworkService = EventsNetworkService()
        
        let scheduleVC = UIStoryboard(name: "Schedule", bundle: nil).instantiateViewController(withIdentifier: "scheduleVC") as! ScheduleListViewController
        scheduleVC.schedulesNetworkService = SchedulesNetworkService()
        
        viewControllers = [
            createNavController(for: eventsVC, title: NSLocalizedString("Events", comment: ""), imageName: "house.fill"),
            createNavController(for: scheduleVC, title: NSLocalizedString("Schedule", comment: ""), imageName: "calendar.badge.clock")
        ]
    }
    
    private func createNavController(for rootViewController: UIViewController,
                                                      title: String,
                                                      imageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }

}

//
//  SplashScreenViewController.swift
//  StreamingApp
//
//  Created by Kuda Zata on 24/6/2022.
//

import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            let tabBar = TabBarViewController()
            tabBar.modalPresentationStyle = .fullScreen
            self.present(tabBar, animated: true)
        }
        
    }
}

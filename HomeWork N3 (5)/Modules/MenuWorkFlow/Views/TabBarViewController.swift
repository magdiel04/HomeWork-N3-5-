//
//  TabBarViewController.swift
//  HomeWork N3 (5)
//
//  Created by Magdiel Altynbekov on 10/2/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        hidesBottomBarWhenPushed = false

    }
    
    private func setupVC() {
            viewControllers = [
                createControllers(for: ViewController(), title: "Home", image: UIImage(systemName: "house.circle")!),
//                createControllers(for: ViewController(), title: "Home", image: UIImage(systemName: "house.circle")!),
                createControllers(for: ProfileViewController(), title: "Profile", image: UIImage(systemName: "person")!),
                createControllers(for: BasketViewController(), title: "Basket", image: UIImage(systemName: "basket")!)   
                    ]
        }
        
        private func createControllers(
            for rootViewController: UIViewController,
            title: String,
            image: UIImage
        ) -> UIViewController {
            let navVC = UINavigationController(rootViewController: rootViewController)
            navVC.tabBarItem.title = title
            navVC.tabBarItem.image = image
            return navVC
            
            
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

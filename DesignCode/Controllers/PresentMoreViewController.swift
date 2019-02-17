//
//  PresentMoreViewController.swift
//  DesignCode
//
//  Created by Chase Klingel on 2/17/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

class PresentMoreViewController: NSObject, UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let moreViewController = toVC as? MoreViewController else { return nil }
        
        moreViewController.previousViewController = fromVC
        
        return self
    }
}

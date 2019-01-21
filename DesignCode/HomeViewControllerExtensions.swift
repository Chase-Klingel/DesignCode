//
//  HomeViewControllerExtensions.swift
//  DesignCode
//
//  Created by Chase Klingel on 1/20/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

extension HomeViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        if offsetY < 0 {
            print("doing")
            heroView.transform =
                CGAffineTransform(translationX: 0, y: offsetY)
            playVisualView.transform =
                CGAffineTransform(translationX: 0, y: -offsetY/3)
            titleLabel.transform =
                CGAffineTransform(translationX: 0, y: -offsetY/3)
            deviceImageView.transform =
                CGAffineTransform(translationX: 0, y: -offsetY/4)
            backgroundImageView.transform =
                CGAffineTransform(translationX: 0, y: -offsetY/5)
        }
    }
}

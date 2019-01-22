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

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! SectionCollectionViewCell
        
        let section = sections[indexPath.row]
        
        cell.coverImageView.image = UIImage(named: section["image"]!)
        cell.titleLabel.text = section["title"]
        cell.captionLabel.text = section["caption"]
        return cell
    }
    
}

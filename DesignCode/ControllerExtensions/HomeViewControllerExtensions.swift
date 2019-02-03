//
//  HomeViewControllerExtensions.swift
//  DesignCode
//
//  Created by Chase Klingel on 1/20/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        let navigationIsHidden = offsetY <= 0
        navigationController?.setNavigationBarHidden(navigationIsHidden, animated: true)
        
        if offsetY < 0 {
            heroView.transform = CGAffineTransform(translationX: 0, y: offsetY)
            playVisualView.transform = CGAffineTransform(translationX: 0, y: -offsetY/3)
            titleLabel.transform = CGAffineTransform(translationX: 0, y: -offsetY/3)
            deviceImageView.transform = CGAffineTransform(translationX: 0, y: -offsetY/4)
            backgroundImageView.transform = CGAffineTransform(translationX: 0, y: -offsetY/5)
        }
        
        if let collectionView = scrollView as? UICollectionView {
            for cell in collectionView.visibleCells as! [SectionCollectionViewCell] {
                let indexPath = collectionView.indexPath(for: cell)!
                let attributes = collectionView.layoutAttributesForItem(at: indexPath)!
                let cellFrame = collectionView.convert(attributes.frame, to: view)
                
                let translationX = cellFrame.origin.x / 5
                cell.coverImageView.transform = CGAffineTransform(translationX: translationX, y: 0)
                
                cell.layer.transform = animateCell(cellFrame: cellFrame)
            }
        }
    }
    
    func animateCell(cellFrame: CGRect) -> CATransform3D {
        let angleFromX = Double((-cellFrame.origin.x) / 10)
        let angle = CGFloat((angleFromX * Double.pi) / 180.0)
        var transform = CATransform3DIdentity
        transform.m34 = -1.0/1000
        let rotation = CATransform3DRotate(transform, angle, 0, 1, 0)
        
        var scaleFromX = (1000 - (cellFrame.origin.x - 200)) / 1000
        let scaleMax: CGFloat = 1.0
        let scaleMin: CGFloat = 0.6
        if scaleFromX > scaleMax {
            scaleFromX = scaleMax
        }
        if scaleFromX < scaleMin {
            scaleFromX = scaleMin
        }
        let scale = CATransform3DScale(CATransform3DIdentity, scaleFromX, scaleFromX, 1)
        
        return CATransform3DConcat(rotation, scale)
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.sectionCell, for: indexPath) as! SectionCollectionViewCell
        
        let section = sections[indexPath.row]
        
        cell.coverImageView.image = UIImage(named: section["image"]!)
        cell.titleLabel.text = section["title"]
        cell.captionLabel.text = section["caption"]
        cell.layer.transform = animateCell(cellFrame: cell.frame)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("did select item")
        performSegue(withIdentifier: Constants.homeToSection, sender: indexPath)
    }
    
}

extension HomeViewController : UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return presentSectionViewController
    }
}

//
//  BenefitsViewControllerExtensions.swift
//  DesignCode
//
//  Created by Chase Klingel on 2/13/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

extension BenefitsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let benefit = benefits[indexPath.row]
        var width: CGFloat = 0.0
        
        switch collectionView.frame.width {
        case 640...959:
            width = collectionView.frame.width / 2
        case 960...3000:
            width = collectionView.frame.width / 3
        default:
            width = collectionView.frame.width
        }
        
        // simulating dynamic labels
        let titleLabel = UILabel()
        titleLabel.frame.size = CGSize(width: width - 120, height: CGFloat.greatestFiniteMagnitude)
        titleLabel.text = benefit["title"]
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        titleLabel.sizeToFit()
        
        let textLabel = UILabel()
        textLabel.frame.size = CGSize(width: width - 120, height: CGFloat.greatestFiniteMagnitude)
        textLabel.text = benefit["body"]
        textLabel.numberOfLines = 5
        textLabel.font = UIFont.preferredFont(forTextStyle: .body)
        textLabel.minimumScaleFactor = 0.5
        textLabel.sizeToFit()
        
        let height = titleLabel.frame.height + textLabel.frame.height + 90
        
        return CGSize(width: width, height: height)
    }
}

extension BenefitsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return benefits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Benefit", for: indexPath) as! BenefitCollectionViewCell
        
        let benefit = benefits[indexPath.row]
        
        cell.subheadLabel.text = benefit["subhead"]?.uppercased()
        cell.titleLabel.text = benefit["title"]
        cell.bodyLabel.text = benefit["body"]
        cell.imageView.image = UIImage(named: "Benefit-\(benefit["image"]!)")
        
        return cell
    }
    
    
}

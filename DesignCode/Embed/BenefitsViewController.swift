//
//  BenefitsViewController.swift
//  DesignCode
//
//  Created by Chase Klingel on 2/13/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

class BenefitsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        adjustSize()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.collectionView.reloadData()
        adjustSize()
    }
    
    func adjustSize() {
        let now = DispatchTime.now()
        let deadline: DispatchTime = now + .milliseconds(100)
        
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            [weak self] in
            
            guard self != nil else { return }
            self!.collectionViewHeightConstraint.constant = self!.collectionView.contentSize.height
        }
    }

}

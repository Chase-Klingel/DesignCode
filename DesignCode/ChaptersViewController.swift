//
//  ChaptersViewController.swift
//  DesignCode
//
//  Created by Chase Klingel on 1/27/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

class ChaptersViewController: UIViewController {
    var reuseId = "sectionCell"
    
    @IBOutlet weak var chapter1CollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chapter1CollectionView.delegate = self
        chapter1CollectionView.dataSource = self
    }

}

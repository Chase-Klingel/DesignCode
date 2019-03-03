//
//  SectionViewController.swift
//  DesignCode
//
//  Created by Chase Klingel on 1/20/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit
import Spring

class SectionViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    var section: Section!
    var sections: Array<Section>!
    var indexPath: IndexPath!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var subheadVisualEffectView: UIVisualEffectView!
    @IBOutlet weak var closeVisualEffectView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        titleLabel.text = section.title
        captionLabel.text = section.caption
        bodyLabel.text = section.body
        coverImageView.image = UIImage(named: section.imageName)
        progressLabel.text = "\(indexPath.row + 1) / \(sections.count)"
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}

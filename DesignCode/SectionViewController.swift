//
//  SectionViewController.swift
//  DesignCode
//
//  Created by Chase Klingel on 1/20/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

class SectionViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    var section: [String: String]!
    var sections: [[String: String]]!
    var indexPath: IndexPath!
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = section["title"]
        captionLabel.text = section["caption"]
        bodyLabel.text = section["body"]
        coverImageView.image = UIImage(named: section["image"]!)
        progressLabel.text = "\(indexPath.row + 1) / \(sections.count)"
    }

}

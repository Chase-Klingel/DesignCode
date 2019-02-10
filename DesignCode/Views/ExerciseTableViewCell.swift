//
//  ExerciseTableViewCell.swift
//  DesignCode
//
//  Created by Chase Klingel on 2/10/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var questions : Array<Dictionary<String, Any>>!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



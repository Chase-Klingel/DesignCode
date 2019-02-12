//
//  ExerciseTableViewCell.swift
//  DesignCode
//
//  Created by Chase Klingel on 2/10/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

protocol ExerciseTableViewCellDelegate: class {
    func exerciseCell(_ cell: ExerciseTableViewCell, receivedAnswer correct: Bool, forQuestion question: Dictionary<String, Any>)
    
    func exerciseCell(_ cell: ExerciseTableViewCell, didReceiveShareFor exercise: Array<Dictionary<String, Any>>, onScoreCell scoreCell: ScoreCollectionViewCell)
}

class ExerciseTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var questions : Array<Dictionary<String, Any>>!
    weak var delegate: ExerciseTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.reloadData()
    }

}





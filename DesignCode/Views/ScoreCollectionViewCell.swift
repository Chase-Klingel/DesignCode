//
//  ScoreCollectionViewCell.swift
//  DesignCode
//
//  Created by Chase Klingel on 2/11/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit
import MKRingProgressView

protocol ScoreCellDelegate: class {
    func scoreCell(_ cell: ScoreCollectionViewCell, didTapTryAgainExercise exercise: Array<Dictionary<String, Any>>)
    func scoreCell(_ cell: ScoreCollectionViewCell, didTapShareExercise exercise: Array<Dictionary<String, Any>>)
}

class ScoreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var percentageView: RingProgressView!
    @IBOutlet weak var percentageLabel: UILabel!
    var exercise: Array<Dictionary<String, Any>>!
    
    weak var delegate: ScoreCellDelegate?
    
    override func awakeFromNib() {
        percentageView.animateTo(72)
        percentageLabel.animateTo(72)
    }
    
    
    @IBAction func tryAgainButtonTapped(_ sender: UIButton) {
        delegate?.scoreCell(self, didTapTryAgainExercise: exercise)
    }
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        delegate?.scoreCell(self, didTapShareExercise: exercise)
    }
    
}

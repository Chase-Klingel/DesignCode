//
//  QuestionCollectionViewCell.swift
//  DesignCode
//
//  Created by Chase Klingel on 2/10/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

protocol QuestionCellDelegate: class {
    func questionCell(_ cell: QuestionCollectionViewCell, answerButtonTapped button: UIButton, forQuestion question: Dictionary<String, Any>)
}

class QuestionCollectionViewCell: UICollectionViewCell {
    var question: Dictionary<String, Any>!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    
    weak var delegate: QuestionCellDelegate?
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        sender.setImage(UIImage(named: "Exercises-Check"), for: .normal)
        delegate?.questionCell(self, answerButtonTapped: sender, forQuestion: question)
    }
    
    
}

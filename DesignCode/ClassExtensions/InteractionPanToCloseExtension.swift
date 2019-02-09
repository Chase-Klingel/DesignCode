//
//  InteractionPanToCloseExtension.swift
//  DesignCode
//
//  Created by Chase Klingel on 2/7/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

extension InteractionPanToClose: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if gestureRecognizer == tapGestureRecognizer && touch.view!.isDescendant(of: dialogView) {
            return false
        }
        
        return true
    }
}



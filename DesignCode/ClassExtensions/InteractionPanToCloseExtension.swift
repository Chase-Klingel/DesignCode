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
}



//
//  UILabel+Inspectable.swift
//  DesignCode
//
//  Created by Chase Klingel on 2/7/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

extension UILabel {
    @IBInspectable var shadowOffsetY: CGFloat {
        set { layer.shadowOffset.height = newValue }
        get { return layer.shadowOffset.height }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        set { layer.shadowRadius = newValue }
        get { return layer.shadowRadius }
    }
    
    @IBInspectable var shadowOpacity: CGFloat {
        set { layer.shadowOpacity = Float(newValue) }
        get { return CGFloat(layer.shadowOpacity) }
    }
}

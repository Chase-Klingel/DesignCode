//
//  UILabel+Animate.swift
//  DesignCode
//
//  Created by Chase Klingel on 2/10/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

extension UILabel {
    func animateTo(_ number: Int) {
        guard number > 0 else { return }
        let now = DispatchTime.now()
        
        for index in 0...number {
            let milliseconds = 10 * index
            let deadline: DispatchTime = now + .milliseconds(milliseconds)
            
            DispatchQueue.main.asyncAfter(deadline: deadline) {
               self.text = "\(index)%"
            }
        }
    }
}

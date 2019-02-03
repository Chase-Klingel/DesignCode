//
//  UIViewControllerExtensions.swift
//  DesignCode
//
//  Created by Chase Klingel on 2/3/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

extension UIViewController {
    @IBAction public func unwindToViewController (_ segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
}

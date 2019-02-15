//
//  PurchaseViewController.swift
//  DesignCode
//
//  Created by Chase Klingel on 2/7/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController {

    @IBOutlet var panToClose: InteractionPanToClose!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        panToClose.setGestureRecognizer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        panToClose.animateDialogAppear()
    }
}

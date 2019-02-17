//
//  MoreViewController.swift
//  DesignCode
//
//  Created by Chase Klingel on 2/2/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit
import MKRingProgressView

class MoreViewController: UIViewController {

    @IBOutlet weak var progress1View: MKRingProgressView!
    @IBOutlet weak var progress2View: MKRingProgressView!
    @IBOutlet weak var progress3View: MKRingProgressView!
    
    @IBOutlet weak var progress1Label: UILabel!
    @IBOutlet weak var progress2Label: UILabel!
    @IBOutlet weak var progress3Label: UILabel!
    
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet var panToClose: InteractionPanToClose!
    
    @IBAction func tappedOutsideDialog(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.panToClose.rotateDialogOut()
        }) {
            (finished) in
            self.tabBarController?.selectedViewController = self.previousViewController
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    weak var previousViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let progresses = [72, 56, 22]
        
        progress1Label.animateTo(progresses[0])
        progress2Label.animateTo(progresses[1])
        progress3Label.animateTo(progresses[2])
        
        progress1View.animateTo(progresses[0])
        progress2View.animateTo(progresses[1])
        progress3View.animateTo(progresses[2])
        
    }

    @IBAction func safariButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: Constants.moreToWeb, sender: "https://designcode.io")
    }
    
    
    @IBAction func communityButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: Constants.moreToWeb, sender: "https://spectrum.chat/design-code")
    }
    
    
    @IBAction func twitterButtonTapped(_ sender: Any) {
            performSegue(withIdentifier: Constants.moreToWeb, sender: "https://twitter.com/mengto")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.moreToWeb {
            let toNav = segue.destination as! UINavigationController
            let toVC = toNav.viewControllers.first! as! WebViewController
            toVC.urlString = (sender as! String)
        }
    }
}

extension MKRingProgressView {
    func animateTo(_ number: Int) {
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0)
        
        self.progress = Double(number)/100
    
        CATransaction.commit()
    }
}

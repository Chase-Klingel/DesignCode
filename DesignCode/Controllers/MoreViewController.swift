//
//  MoreViewController.swift
//  DesignCode
//
//  Created by Chase Klingel on 2/2/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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

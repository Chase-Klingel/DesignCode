//
//  WebViewController.swift
//  DesignCode
//
//  Created by Chase Klingel on 2/2/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var urlString: String!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func actionButtonTapped(_ sender: Any) {
        let activityItems = [urlString] as! Array<String>
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        activityController.excludedActivityTypes = [.postToFacebook]
        
        present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func forwardButtonTapped(_ sender: Any) {
        webView.goForward()
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func safariButtonTapped(_ sender: Any) {
        UIApplication.shared.open(URL(string: urlString)!)
    }
    
    
    @IBAction func reloadButtonTapped(_ sender: Any) {
        webView.reload()
    }
}

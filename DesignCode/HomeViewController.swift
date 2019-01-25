//
//  ViewController.swift
//  DesignCode
//
//  Created by Chase Klingel on 1/14/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit
import AVKit

class HomeViewController: UIViewController {
    let reuseId = "sectionCell"
    let homeToSection =  "HomeToSection"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var deviceImageView: UIImageView!
    @IBOutlet weak var playVisualView: UIVisualEffectView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var heroView: UIView!
    @IBOutlet weak var bookView: UIView!
    @IBOutlet weak var chapterCollectionView: UICollectionView!

    // [play][type][action]
    @IBAction func playButtonTapped(_ sender: Any) {
        let urlString = "https://player.vimeo.com/external/235468301.hd.mp4?s=e852004d6a46ce569fcf6ef02a7d291ea581358e&profile_id=175"
        
        let url = URL(string: urlString)
        let player = AVPlayer(url: url!)
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        chapterCollectionView.delegate = self
        chapterCollectionView.dataSource = self
        
        animateHeroViewOnLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("preparing")
        if segue.identifier == homeToSection {
            let toViewController = segue.destination as! SectionViewController
            let indexPath = sender as! IndexPath
            let section = sections[indexPath.row]
            
            toViewController.section = section
            toViewController.sections = sections
            toViewController.indexPath = indexPath
        }
    }
    
    private func animateHeroViewOnLoad() {
        titleLabel.alpha = 0
        deviceImageView.alpha = 0
        playVisualView.alpha = 0
        
        UIView.animate(withDuration: 1) {
            self.titleLabel.alpha = 1
            self.deviceImageView.alpha = 1
            self.playVisualView.alpha = 1
        }
    }
}


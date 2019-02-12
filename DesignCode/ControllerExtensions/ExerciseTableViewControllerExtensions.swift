//
//  ExerciseTableViewControllerExtensions.swift
//  DesignCode
//
//  Created by Chase Klingel on 2/11/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

extension ExerciseTableViewController: ExerciseTableViewCellDelegate {
    func exerciseCell(_ cell: ExerciseTableViewCell, didReceiveShareFor exercise: Array<Dictionary<String, Any>>, onScoreCell scoreCell: ScoreCollectionViewCell) {
        let message = "🙌 72% in the iOS Design challenge from the Design+Code app by @MengTo"
        let link = URL(string: "https://designcode.io/")!
        guard let image = UIImage(view: scoreCell) else { return }
        let objectsToShare = [message, link, image] as Array<Any>
        let activity = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activity.excludedActivityTypes = [.airDrop, .addToReadingList, .saveToCameraRoll]
        activity.popoverPresentationController?.sourceView = scoreCell
        present(activity, animated: true)
    }
    
    func exerciseCell(_ cell: ExerciseTableViewCell, receivedAnswer correct: Bool, forQuestion question: Dictionary<String, Any>) {
        performSegue(withIdentifier: Constants.presentExerciseDialog, sender: nil)
    }
}

extension UIImage {
    convenience init?(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        guard let currentContext = UIGraphicsGetCurrentContext() else { return nil }
        view.layer.render(in: currentContext)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let graphicImage = image?.cgImage else {
            return nil
        }
        self.init(cgImage: graphicImage)
    }
}

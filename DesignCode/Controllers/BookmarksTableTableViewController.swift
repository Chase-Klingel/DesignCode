//
//  BookmarksTableTableViewController.swift
//  DesignCode
//
//  Created by Chase Klingel on 1/28/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

class BookmarksTableTableViewController: UITableViewController {
    var bookmarks: [[String: String]] = allBookmarks
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.bookmarkCell) as! BookmarkTableViewCell
        
        let bookmark = bookmarks[indexPath.row]
        
        cell.chapterTitleLabel.text = bookmark["content"]!.uppercased()
        cell.titleLabel.text = bookmark["part"]
        cell.bodyLabel.text = bookmark["content"]
        cell.chapterNumberLabel.text = bookmark["chapter"]
        cell.badgeImageView.image = UIImage(named: "Bookmarks/" + bookmark["type"]!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.bookmarksToSection, sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.bookmarksToSection {
            let destination = segue.destination as! SectionViewController
            destination.section = sections[0]
            destination.sections = sections
            destination.indexPath = sender as? IndexPath
        }
    }
    
}

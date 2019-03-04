//
//  BookmarksTableTableViewController.swift
//  DesignCode
//
//  Created by Chase Klingel on 1/28/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import UIKit

class BookmarksTableTableViewController: UITableViewController {
    var bookmarks: Array<Bookmark> = { return CoreDataManager.shared.bookmarks }()
    var sections: Array<Section> = { return CoreDataManager.shared.sections }()

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
        let part = bookmark.part!
        let section = bookmark.section!
        
        cell.chapterTitleLabel.text = section.title!.uppercased()
        cell.titleLabel.text = part.title
        cell.bodyLabel.text = part.content
        cell.chapterNumberLabel.text = section.chapterNumber
        cell.badgeImageView.image = UIImage(named: "Bookmarks/" + (part.type ?? "text"))
        
        return cell
    }
    
    // TODO : Fix this 
    /*override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            let bookmark = bookmarks[indexPath.row]
            CoreDataManager.shared.remove(bookmark)
            tableView.deleteRows(at: [indexPath], with: .top)
            tableView.endUpdates()
        }
    } */

    
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

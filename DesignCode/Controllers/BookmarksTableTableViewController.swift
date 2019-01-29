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
        let cell = UITableViewCell() // tableView.dequeueReusableCell(withIdentifier: "something")
        cell.textLabel?.text = bookmarks[indexPath.row]["content"]
        
        return cell
    }
}

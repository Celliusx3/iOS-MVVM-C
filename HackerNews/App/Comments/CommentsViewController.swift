//
//  CommentsViewController.swift
//  HackerNews
//
//  Created by Oh Coyan on 01/03/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import Foundation
import UIKit

class CommentsViewController:  UIViewController, Storyboarded  {
    static var storyboard: AppStoryboard = AppStoryboard.comments
    var commentsViewModel: CommentsViewModel?
    
    @IBOutlet weak var commentsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        commentsTableView.dataSource = self
        self.commentsTableView.register(UINib(nibName: K.commentsCellNibName, bundle: nil), forCellReuseIdentifier: K.commentsCellIdentifier)
    }
}

extension CommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsViewModel?.getCommentsModels()?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.commentsCellIdentifier, for: indexPath) as! CommentsViewCell
        if let gg = commentsViewModel?.getCommentsModels()?[indexPath.row] {
            cell.commentsTextView?.attributedText = gg.text.htmlToAttributedString
        }
        return cell
    }
}

//
//  CommentsViewCell.swift
//  HackerNews
//
//  Created by Oh Coyan on 02/03/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import UIKit

class CommentsViewCell: UITableViewCell {

    @IBOutlet weak var commentsTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

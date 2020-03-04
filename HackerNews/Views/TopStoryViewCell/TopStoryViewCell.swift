//
//  TopStoryViewCell.swift
//  HackerNews
//
//  Created by Oh Coyan on 25/02/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import UIKit

class TopStoryViewCell: UITableViewCell {

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  SwipeTableViewCell.swift
//  SwipeableTableView
//
//  Created by youngjun goo on 2019/10/14.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit

struct CellData {
    let image: String
    let name: String
}

class SwipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellNameLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView! {
        didSet {
            self.cellImageView.contentMode = .scaleToFill
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

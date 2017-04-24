//
//  MenuCell.swift
//  Twitter
//
//  Created by Utkarsh Sengar on 4/22/17.
//  Copyright © 2017 Area42. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    
    @IBOutlet weak var menuLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red:0.11, green:0.63, blue:0.95, alpha:1.00)
        menuLabel.textColor = UIColor.white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

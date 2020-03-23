//
//  ItemCell.swift
//  Homepwner
//
//  Created by Luca Stanger on 23.03.20.
//  Copyright © 2020 Luca Stanger. All rights reserved.
//

//import Foundation
import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontSizeToFitWidth = true
        serialNumberLabel.adjustsFontSizeToFitWidth = true
        valueLabel.adjustsFontSizeToFitWidth = true
    }
}

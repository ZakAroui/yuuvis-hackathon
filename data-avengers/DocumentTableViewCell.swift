//
//  DocumentTableViewCell.swift
//  data-avengers
//
//  Created by Cesar Lema on 4/7/19.
//  Copyright © 2019 Zack Aroui. All rights reserved.
//

import UIKit

class DocumentTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // ---------- Instance Properties -----------------------------
    @IBOutlet weak var documentPreview: UILabel!
    
    @IBOutlet weak var documentLabel: UILabel!
    
    
    // ---------- Instance Properties -----------------------------
}

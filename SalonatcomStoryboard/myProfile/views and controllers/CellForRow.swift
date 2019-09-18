//
//  CellForRow.swift
//  SalonatcomStoryboard
//
//  Created by Bassam Ramadan on 9/12/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit

class CellForRow: UITableViewCell {
    @IBOutlet var img : UIImageView!
    @IBOutlet var icon : UIImageView!
    @IBOutlet var service : UILabel!
    @IBOutlet var subtitleService : UILabel!
    @IBOutlet var uv : UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }
}

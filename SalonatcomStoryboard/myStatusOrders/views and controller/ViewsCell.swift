//
//  ViewsCell.swift
//  SalonatcomStoryboard
//
//  Created by Bassam Ramadan on 9/13/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit

class ViewsCell: UITableViewCell {

    @IBOutlet weak var imageSallon : UIImageView!
    @IBOutlet weak var icon : UIImageView!
    @IBOutlet weak var dateOrder : UILabel!
    @IBOutlet weak var nameSallon : UILabel!
    @IBOutlet weak var statusOrder : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

}

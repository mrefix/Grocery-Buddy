//
//  CustomCells.swift
//  Grocery Buddy
//
//  Created by Evan Fix on 4/25/17.
//  Copyright © 2017 Evan Fix. All rights reserved.
//

import UIKit

class AllListTableViewCell : UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var notificationImage: UIImageView!
    @IBOutlet weak var purchaseDate: UILabel!
    @IBOutlet weak var finishDate: UILabel!
    var ID : Int = -1
}

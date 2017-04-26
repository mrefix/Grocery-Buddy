//
//  DetailViewController.swift
//  Grocery Buddy
//
//  Created by oxfordcg1 on 4/6/17.
//  Copyright © 2017 Evan Fix. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var UPC: Int = -1
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var purchaseDateLabel: UILabel!
    @IBOutlet weak var expirationDateLabel: UILabel!
    @IBOutlet weak var shoppingCartImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let p = GlobalVariables.productDictionary[UPC] {
            titleLabel.text = p.title
            purchaseDateLabel.text = p.purchaseDateString
            expirationDateLabel.text = p.expDateString
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}


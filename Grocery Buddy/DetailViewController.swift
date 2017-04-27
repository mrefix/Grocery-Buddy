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
    @IBOutlet weak var quantityLevelImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let p = GlobalVariables.productDictionary[UPC] {
            titleLabel.text = p.title
            purchaseDateLabel.text = p.purchaseDateString
            expirationDateLabel.text = p.expDateString
            if p.isInShoppingCart {
                shoppingCartImage.image = #imageLiteral(resourceName: "shoppingCart")
            }
//            if p.quantity != nil {
//                quantityLevelImage.image = p.quantity?.getQuantityLevelImage
//            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


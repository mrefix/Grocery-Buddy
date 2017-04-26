//
//  DetailViewController.swift
//  Grocery Buddy
//
//  Created by oxfordcg1 on 4/6/17.
//  Copyright © 2017 Evan Fix. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var purchaseDateLabel: UILabel!
    @IBOutlet weak var expirationDateLabel: UILabel!
    
    var isInShoppingCart : Bool = false
    @IBOutlet weak var shoppingCartImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}


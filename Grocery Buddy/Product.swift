//
//  Product.swift
//  Grocery Buddy
//
//  Created by Evan Fix on 4/25/17.
//  Copyright © 2017 Evan Fix. All rights reserved.
//

import Foundation
import UIKit

// GLOBAL:
struct GlobalVariables {
    static var productDictionary : [Int: Product] =
        [
            001: Product(setUPC: 001, setTitle: "first", setQuantity: Quantity(quantity: 3, measurement: "gallons")),
            002: Product(setUPC: 002, setTitle: "second"),
            03: Product(setUPC: 03, setTitle: "third", setQuantity: Quantity(quantity: 5), setIsInShoppingCart: true)
        ]
    static var productKeyList : [Int] {
        get { return [Int](productDictionary.keys) }
    }
    static var shoppingCartKeyList : [Int] {
        get {
            var result : [Int] = []
            for (key, product) in productDictionary {
                if product.isInShoppingCart {
                    result.append(key)
                }
            }
            print(result)
            return result
        }
    }
    static var pantryKeyList : [Int] {
        get {
            var result : [Int] = []
            for (key, product) in productDictionary {
                if product.isInPantry! {
                    print("Product in is pantry")
                    if !(product.isInShoppingCart) {
                        result.append(key)
                    }
                }
            }
            print(result)
            return result
        }
    }
}

struct Quantity {
    public enum QuantityLevelEnum { case EMPTY, LOW, MEDIUM, FULL }
    var currentQuantity : Int = 0
    var measurement : String?
    var startingQuantity : Int = 0
    var quantityLevel : QuantityLevelEnum = QuantityLevelEnum.FULL

    init(quantity num: Int, measurement m: String? = nil) {
        currentQuantity = num
        measurement = m
        startingQuantity = num
        quantityLevel = QuantityLevelEnum.FULL
    }
    
    var getQuantityLevelImage : UIImage? {
        get {
            switch(quantityLevel) {
            case .EMPTY : return #imageLiteral(resourceName: "warningRed")
            case .FULL : return #imageLiteral(resourceName: "fullLevel")
            case .LOW : return #imageLiteral(resourceName: "warningYellow")
            case .MEDIUM : return #imageLiteral(resourceName: "mediumLevel")
            }
        }
    }
}

struct UPC {
    var upc : Int = 0
    init(_ upc: Int) { self.upc = upc }
}
    
class Product {
    var dateFormatter = DateFormatter()
    
    public enum CategoryType {
        case DAIRY, SNACK, MEAT, DRINK, OTHER;
    }
    
    init(setUPC upc: Int, setTitle title: String, setQuantity quantity: Quantity = Quantity(quantity: 1, measurement: ""), setCategory cat: CategoryType = CategoryType.OTHER, setExpDate expD: Date? = nil, setFinishDate finD: Date? = nil, setPurchaseDate purchaseD: Date = Date(), setAisle aisle: Int = -1, setIsInShoppingCart isInCart: Bool = false) {
        self._UPC = UPC(1)
        self.title = title
        self.quantity = quantity
        self.category = cat
        self.expDate = expD
        self.finishDate = finD
        self.purchaseDate = purchaseD
        self.aisle = aisle
        self.isInShoppingCart = isInCart
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateFormatter.locale = Locale.init(identifier: "en_US")
    }
    
    // PRIVATE FIELDS
    private var _UPC : UPC
    private var _title : String = ""
    // _quantity is nil iff the user has never shopped for the item (yet it's in the history/cart)
    private var _quantity : Quantity?
    private var _numPurchased : Int = 0
    private var _category : CategoryType = CategoryType.OTHER
    private var _expDate : Date?
    private var _finishDate : Date?
    private var _purchaseDate : Date = Date()
    private var _aisle : Int?
    private var _isInShoppingCart : Bool = false
    
    // GETTERS SETTERS
    
    // ************************
    // TODO: provide validation
    // ************************
    var upc: UPC {
        set { _UPC = newValue }
        get { return _UPC }
    }
    var title: String {
        set { _title = newValue }
        get { return _title }
    }
    var quantity: Quantity? {
        set { _quantity = newValue }
        get { return _quantity }
    }
    var numPurchased: Int {
        set { _numPurchased = newValue }
        get { return _numPurchased }
    }
    var category: CategoryType {
        set { _category = newValue }
        get { return _category }
    }
    var expDate: Date? {
        set { _expDate = newValue }
        get { return _expDate }
    }
    var finishDate: Date? {
        set { _finishDate = newValue }
        get { return _finishDate }
    }
    var purchaseDate: Date {
        set { _purchaseDate = newValue }
        get { return _purchaseDate }
    }
    var expDateString: String? {
        set { _expDate = dateFormatter.date(from: newValue!)! }
        get { return _expDate != nil ? dateFormatter.string(from: _expDate!) : nil}
    }
    var finishDateString: String? {
        set { _finishDate = dateFormatter.date(from: newValue!)! }
        get { return _finishDate != nil ? dateFormatter.string(from: _finishDate!) : nil }
    }
    var purchaseDateString: String {
        set { _purchaseDate = dateFormatter.date(from: newValue)! }
        get { return dateFormatter.string(from: _purchaseDate) }
    }
    var aisle: Int? {
        set { _aisle = newValue }
        get { return _aisle }
    }
    var isInShoppingCart : Bool {
        set { _isInShoppingCart = newValue }
        get { return _isInShoppingCart }
    }
    var isInPantry : Bool? {
        get { return _quantity != nil ?
            (_quantity!.currentQuantity >= 0 ? true : false)
            : nil }
    }
}

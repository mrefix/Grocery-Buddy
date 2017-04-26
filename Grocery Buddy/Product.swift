//
//  Product.swift
//  Grocery Buddy
//
//  Created by Evan Fix on 4/25/17.
//  Copyright © 2017 Evan Fix. All rights reserved.
//

import Foundation

// GLOBAL:
struct GlobalVariables {
    static var productList : [Product] = [Product(setTitle: "first", setQuantity: Quantity(number: 3, measurement: "gallons")), Product(setTitle: "second")]
}

struct Quantity {
    var number : Int = 0
    var measurement : String = ""
    init(number num: Int, measurement m: String) {
        number = num
        measurement = m
    }
}
    
class Product {
    public enum CategoryType {
        case DAIRY, SNACK, MEAT, DRINK, OTHER;
    }
    
    init(setTitle title: String, setQuantity quantity: Quantity = Quantity(number: 1, measurement: ""), setCategory cat: CategoryType = CategoryType.OTHER, setExpDate expD: Date = Date(), setFinishDate finD: Date = Date(timeIntervalSinceNow: 100), setPurchaseDate purchaseD: Date = Date(), setAisle aisle: Int = -1) {
        self.title = title
        self.quantity = quantity
        self.category = cat
        self.expDate = expD
        self.finishDate = finD
        self.purchaseDate = purchaseD
        self.aisle = aisle
    }
    
    // PRIVATE FIELDS
    private var _UPC : Int = 0
    private var _title : String = ""
    private var _quantity : Quantity = Quantity(number: -1, measurement: "")
    private var _numPurchased : Int = 0
    private var _category : CategoryType = CategoryType.OTHER
    private var _expDate : Date = Date(timeIntervalSinceNow: 3600)
    private var _finishDate : Date = Date(timeIntervalSinceNow: 360)
    private var _purchaseDate : Date = Date()
    private var _aisle : Int = -1
    
    // GETTERS SETTERS
    
    // ************************
    // TODO: provide validation
    // ************************
    var upc: Int {
        set { _UPC = newValue }
        get { return _UPC }
    }
    var title: String {
        set { _title = newValue }
        get { return _title }
    }
    var quantity: Quantity {
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
    var expDate: Date {
        set { _expDate = newValue }
        get { return _expDate }
    }
    var finishDate: Date {
        set { _finishDate = newValue }
        get { return _finishDate }
    }
    var purchaseDate: Date {
        set { _purchaseDate = newValue }
        get { return _purchaseDate }
    }
    var aisle: Int {
        set { _aisle = newValue }
        get { return _aisle }
    }
    
}

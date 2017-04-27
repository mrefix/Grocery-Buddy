//
//  MasterViewController.swift
//  Grocery Buddy
//
//  Created by oxfordcg1 on 4/6/17.
//  Copyright © 2017 Evan Fix. All rights reserved.
//

import UIKit
import Firebase

class MasterViewController: UITableViewController {

    @IBOutlet var myTable: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var currentTableViewList : [Int] = GlobalVariables.productKeyList
    @IBAction func segmentedControlActionChanged(_ sender: Any) {
        switch(segmentedControl.selectedSegmentIndex) {
        case 0: currentTableViewList = GlobalVariables.productKeyList
        case 1: currentTableViewList = GlobalVariables.pantryKeyList
        case 2: currentTableViewList = GlobalVariables.shoppingCartKeyList
        default: break;
        }
        myTable.reloadData()
    }
    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: Selector("addButtonTouched()"))
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addButtonTouched(sender: UIBarButtonItem) -> Void {
        performSegue(withIdentifier: "addProduct", sender: self)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let UPCFromRow = GlobalVariables.productKeyList[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.UPC = UPCFromRow
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
        if segue.identifier == "addProduct" {
            
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentTableViewList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AllListTableViewCell
        let row = indexPath.row
        
        let keyForRow = currentTableViewList[row]
        if let product = GlobalVariables.productDictionary[keyForRow] {
            cell.title.text = product.title
            cell.purchaseDate.text = product.purchaseDateString
            cell.notificationImage.image = #imageLiteral(resourceName: "warningYellow") // This will be determined depending on subtraction of dates
            cell.finishDate.text = product.finishDateString
        }
        else {
            cell.title.text = "Something went wrong"
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            
        }
    }
}


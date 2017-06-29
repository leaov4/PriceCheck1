//
//  MyCarsTableViewController.swift
//  PriceCheck1
//
//  Created by Lea Overend on 6/27/17.
//  Copyright © 2017 loverend. All rights reserved.
//

import UIKit

var cars: [PriceCheckCar] = []

class MyCarsTableViewController: UITableViewController, AddPriceCheckCarDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // let car1 = PriceCheckCar(make: "Jeep", model: "Wrangler", year: "2009", price: "$15,000")
        // cars.append(car1!)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cars.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = cars[indexPath.row].make
        cell.detailTextLabel?.text = cars[indexPath.row].model

        return cell
    }
    
    func didSavePriceCheckCar(car: PriceCheckCar){
        cars.append(car)
        self.tableView.reloadData()
        
    }
    
    func willSavePriceCheckCar(){
    }
    /*
    func carWasSaved(car: PriceCheckCar) {
        cars.append(car)
        self.tableView.reloadData()
    }
    */
    
    func didCancel(){
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "1234" {
            let priceCheckCarDetailViewController = segue.destination as! PriceCheckCarDetailViewController
           let cell = sender as! UITableViewCell
           let indexPath = tableView.indexPath(for: cell)
           priceCheckCarDetailViewController.car = cars[(indexPath?.row)!]
        }
        /*
        if segue.identifier == "navToAddCar" {
            let navigationViewController = segue.destination as! UINavigationController
            
            let addPriceCheckCarViewController = navigationViewController.topViewController as! AddPriceCheckCarViewController
            addPriceCheckCarViewController.delegate = self
            
        }*/
    }
    

}

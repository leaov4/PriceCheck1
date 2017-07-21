//
//  MyCarsTableViewController.swift
//  PriceCheck1
//
//  Created by Lea Overend on 6/27/17.
//  Copyright © 2017 loverend. All rights reserved.
//

import UIKit

var cars: [PriceCheckCar] = []
var fetchedcars: [PriceCheckCar] = []
var ids = [String]()
var theId = "1"

let imageUrlStringSide = "http://www.clker.com/cliparts/Z/N/q/a/3/l/old-car-outline-hi.png"
let imageUrlStringFront = "http://images.clipartpanda.com/vehicle-clip-art-faceman_Suburban_Assault_Vehicle_(Front).png"
let imageUrlStringOtherSide = "http://www.clker.com/cliparts/6/3/d/4/11954231691370781588faceman_Suburban_Assault_Vehicle_(Side).svg.hi.png"

var carsArr: [AnyObject?] = []
var hasBeenFetched = false
var hasBeenDoubleFetched = false

class MyCarsTableViewController: UITableViewController, AddPriceCheckCarDelegate {

    let image1 = #imageLiteral(resourceName: "images")
    let image2 = #imageLiteral(resourceName: "car-outline-clipart-4")

    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (hasBeenFetched != true && hasBeenDoubleFetched != true){
            fetchCars()
        }
    }

    //FIRST GET FUCNTION TO GET DEALER ID GIVEN DEALER CODE
    func fetchCars(){
        
       //http://caruploader.dev.pricecheck.co.za/index.php/api/getCars?dealer_id=1
        
       // let code = defaults.string(forKey: defaultsKeys.keyCode)

       let code = "5903508d833a"
        
        let Endpoint: String = "http://caruploader.dev.pricecheck.co.za/index.php/api/auth?code=\(code)"
        guard let url = URL(string: Endpoint) else {
            print("Error: cannot create URL")
            return
        }
        print(Endpoint)
        
        let urlRequest = URLRequest(url: url)
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print(error)
                print("error calling GET")
                return
            }
            print("no error")
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            // parse the result as JSON, since that's what the API provides
            do {
                guard let todo = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] else {
                print("error trying to convert data to JSON")
                return
                }
                
                if let data = data,
                    let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                    let results = json["result"] as? [[String: Any]] {
                    for result in results {
                        if let dealerid = result["dealer_id"] as? String {
                            print(dealerid)
                            theId = dealerid
                            ids.append(dealerid)
                            self.cars1(myString: dealerid)
                        }
                   }
               }
               print (ids)
              
               guard let status = todo["status"] as? String else {
               print("Could not get ID from JSON")
                  return
              }
               
               print("The status is: " + status)
                
            } catch {
                print("error trying to convert data to JSON")
                return
            }
        }
        hasBeenFetched = true
        task.resume()
    }
    
    /*
    func postCars(){
        let params = [
            "id": "10",
            "parameters": [
                ["name":"hash", "value": "hash_user"]
            ]
        ] as [String : Any]
        guard let url = URL(string: "http://caruploader.dev.pricecheck.co.za/index.php/api/addCar") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else { return}
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) {(data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: data)
            }
        }
      }
    }*/
    
    //END 2ND GET CALL

    func cars1(myString: String){
    
    print("Calling cars1")
    let todoEndpoint: String = "http://caruploader.dev.pricecheck.co.za/index.php/api/getCars?dealer_id=\(myString)"
    guard let url = URL(string: todoEndpoint) else {
    print("Error: cannot create URL")
    return
    }
    let urlRequest = URLRequest(url: url)
    
    // set up the session
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    
    // make the request
    let task = session.dataTask(with: urlRequest) {
        (data, response, error) in
        // check for any errors
        guard error == nil else {
            print("error calling GET on /todos/1")
            print(error)
            return
        }
        // make sure we got data
        guard let responseData = data else {
            print("Error: did not receive data")
            return
        }
        // parse the result as JSON, since that's what the API provides
        do {
            guard let todo = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] else {
                print("error trying to convert data to JSON")
                return
            }
            
            if let data = data,
                let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                let results = json["result"] as? [[String: Any]] {
                for result in results {
                    let make7 = result["make"] as? String
                    let model7 = result["model"] as? String
                    let year7 = result["year"] as? String
                    let price7 = result["price"] as? String
                    let car_id7 = result["car_id"] as? String
                    let dealer_id7 = result["dealer_id"] as? String
                    let new_used7 = result["new_used"] as? String
                    let mileage7 = result["mileage"] as? String
                    let colour7 = result["colour"] as? String
                    let transmission7 = result["transmission"] as? String
                    let body_type7 = result["body_type"] as? String
                    let condition7 = result["condition"] as? String
                    let vin_number7 = result["vin_number"] as? String
                    let mm_code_id7 = result["mm_code_id"] as? String
                    let range7 = result["range"] as? String
                    let fueltype7 = result["fuel_type"] as? String
                       
                    let newPriceCheckCar1 = PriceCheckCar(make: make7, model: model7, year: year7, price: price7, car_id: car_id7, dealer_id: dealer_id7, new_used: new_used7, mileage: mileage7, colour: colour7, transmission: transmission7, body_type: body_type7, condition: condition7, vin_number: vin_number7 , mm_code_id: mm_code_id7, range: range7, fuel_type: fueltype7, frontView: self.image1, sideView: self.image2, otherSideView: self.image2 )
                        cars.append(newPriceCheckCar1!)
                    print("Done")
                }
                self.tableView.reloadData()
            }
            
            // now we have the todo, let's just print it to prove we can access it
            print("hello")
            print("The todo is: " + todo.description)
            
            guard let todoTitle = todo["results"] as? String else {
                print("Could not get todo title from JSON")
                return
            }
            
            print("The title is: " + todoTitle)
        
        } catch  {
            
            print("error trying to convert data to JSON")
            return
        }
    }
    
    print("cars1 over")
    task.resume()

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

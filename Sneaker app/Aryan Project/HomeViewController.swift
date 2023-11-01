//
//  HomeViewController.swift
//  Aryan Project
//
//  Created by Akkriti Patil on 28/10/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var highname: [String] = ["Jordan 1 PSG", "Jordan 1 Next Chapter", "Jordan 1 Dior", "Jordan 1 Mocha"]
    var highprice: [Int] = [40000, 30000, 700000, 60000]
    
    var midname: [String] = ["Jordan 1 Bred", "Jordan 1 Light Smoke Grey", "Jordan 1 Black Fire Red", "Jordan 1 White Iron Ore"]
    var midprice: [Int] = [20000, 25000, 17000, 20000]
    
    var lowname: [String] = ["Jordan 1 Panda", "Jordan 1 Fight Club", "Jordan 1 Teal Purple", "Jordan 1 Black Cement"]
    var lowprice: [Int] = [19000, 18000, 15000, 19000]
    
    var slidename: [String] = ["Yeezy Foam Runner Sand", "Yeezy Slides Pure", "Yeezy Slides Onyx", "Crocs Pollex"]
    var slideprice: [Int] = [15000, 11000, 13000, 15000]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        let images = [UIImage(named: "ss1.jpg")!, UIImage(named: "ss2.jpg")!, UIImage(named: "ss3.jpg")!, UIImage(named: "ss4.jpg")!, UIImage(named: "ss5.jpg")!]
        
        slideShow.animationImages = images
        slideShow.animationDuration = 10.0
        slideShow.animationRepeatCount = 0
        slideShow.startAnimating()
    }
    
    @IBOutlet weak var slideShow: UIImageView!
    
    var categoryIndex = 0
    
    var dataImg: String = ""
    var dataName: [String] = []
    var dataPrice: [Int] = []
    
    @IBAction func category(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
            
        case 0: dataImg = "high"
            dataName = highname
            dataPrice = highprice
            
            categoryIndex = 0
            tableView.reloadData()
            
        case 1: dataImg = "mids"
            dataName = midname
            dataPrice = midprice
            
            categoryIndex = 1
            tableView.reloadData()
            
        case 2: dataImg = "low"
            dataName = lowname
            dataPrice = lowprice
            
            categoryIndex = 2
            tableView.reloadData()
            
        case 3: dataImg = "slide"
            dataName = slidename
            dataPrice = slideprice
            
            categoryIndex = 3
            tableView.reloadData()
            
        default: dataImg = "high"
            dataName = highname
            dataPrice = highprice
            
            categoryIndex = 0
            tableView.reloadData()
            
        }
    }
    
    @IBAction func checkout(_ sender: Any) {
        
        performSegue(withIdentifier: "checkout", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? CheckoutViewController {
            
            destination.message = "Congratulations!!\nYour order has been placed."
        }
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell

        if categoryIndex == 0 {
            
            cell.shoeImage.image = UIImage(named: "high\(indexPath.row+1).jpg")
            cell.shoeName.text = highname[indexPath.row]
            cell.shoePrice.text = "Price: ₹" + String(highprice[indexPath.row])
            cell.qty.text = String(0)
            
        } else {
            
            cell.shoeName.text = dataName[indexPath.row]
            cell.shoePrice.text = "Price: ₹" + String(dataPrice[indexPath.row])
            cell.shoeImage.image = UIImage(named: "\(dataImg)\(indexPath.row+1).jpg")
            cell.qty.text = String(0)
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if categoryIndex == 0 {
            return highname.count
        }
        
        return dataName.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 140
    }
    
}

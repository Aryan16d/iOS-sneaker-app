//
//  MyTableViewCell.swift
//  Aryan Project
//
//  Created by Akkriti Patil on 28/10/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shoeImage: UIImageView!
    
    @IBOutlet weak var shoeName: UITextView!
    
    @IBOutlet weak var shoePrice: UITextView!
    
    @IBOutlet weak var qty: UILabel!
    
    @IBAction func plus(_ sender: Any) {
        
        qty.text = String(Int(qty.text!)! + 1)
    }
    
    @IBAction func minus(_ sender: Any) {
        
        qty.text = String(Int(qty.text!)! - 1)
        
        if Int(qty.text!)! < 0 {
            qty.text = String(0)
        }
    }
    
}

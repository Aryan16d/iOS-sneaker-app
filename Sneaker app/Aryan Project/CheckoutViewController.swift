//
//  CheckoutViewController.swift
//  Aryan Project
//
//  Created by Akkriti Patil on 01/11/23.
//

import UIKit

class CheckoutViewController: UIViewController {

    var message: String = ""
    
    @IBOutlet weak var checkout: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        checkout.text = message
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

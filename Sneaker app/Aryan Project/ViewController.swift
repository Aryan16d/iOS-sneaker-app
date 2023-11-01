//
//  ViewController.swift
//  Aryan Project
//
//  Created by Akkriti Patil on 28/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        username.text = ""
        password.text = ""
    }
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func login(_ sender: Any) {
        if username.text == "Aryan" && password.text == "123456" {
            performSegue(withIdentifier: "home", sender: self)
        }
        else {
            let alert = UIAlertController(title: "error", message: "Wrong Username or Password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default))
            present( alert, animated: true)
        }
    }
}


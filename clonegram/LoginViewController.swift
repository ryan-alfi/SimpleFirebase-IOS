//
//  LoginViewController.swift
//  clonegram
//
//  Created by iMac on 1/24/17.
//  Copyright © 2017 Dycode. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginTapped(_ sender: Any) {
        guard emailField.text != "", pwField.text != "" else{
            return
        }
        
        
        FIRAuth.auth()?.signIn(withEmail: emailField.text!, password: pwField.text!, completion: { (user, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let user = user {
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "userVC")
                
                self.present(vc, animated: true, completion: nil)
            }
        })
    }

}

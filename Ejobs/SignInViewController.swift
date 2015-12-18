//
//  SignInViewController.swift
//  Ejobs
//
//  Created by anis ben brahim on 16/12/2015.
//  Copyright © 2015 anis ben brahim. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func SignInButtonTapped(sender: AnyObject) {
        
        let username = EmailField.text
        let password = PasswordField.text
        
        
                
    }
   
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    
    

}

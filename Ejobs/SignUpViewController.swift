//
//  SignUpViewController.swift
//  Ejobs
//
//  Created by anis ben brahim on 14/12/2015.
//  Copyright © 2015 anis ben brahim. All rights reserved.
//

import UIKit
import Foundation

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate ,UITextFieldDelegate {

    @IBOutlet weak var CVPhotoImageView: UIImageView!
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var verificationPasswordField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var CancelButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func CancelbuttonAction(sender: AnyObject) {
         self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    @IBAction func selectCVPhoto(sender: AnyObject) {
        var myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerControllerSourceType.Camera
        
        self.presentViewController(myPickerController, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        
        CVPhotoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func DisplayMyAlertMessage(userMessage : String , titleS: String){
        
        var myAlert = UIAlertController(title: titleS, message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil);
        
        myAlert.addAction(okAction);
        
        
        self.presentViewController(myAlert, animated: true, completion: nil);
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        emailField.resignFirstResponder()
        return true
    }


    @IBAction func SignUpButtonTapped(sender: AnyObject) {
        
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        verificationPasswordField.resignFirstResponder()
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        
        
        
        let email = emailField.text
        let password = passwordField.text
        let verifPassword = verificationPasswordField.text
        let firstName = firstNameField.text
        let lastName = lastNameField.text
        
        
        if (email!.isEmpty || password!.isEmpty || verifPassword!.isEmpty || firstName!.isEmpty || lastName!.isEmpty){
            
            DisplayMyAlertMessage("No missing field allowed",titleS: "Alert");
            return
            
        }
        
        if(password != verifPassword ){
            DisplayMyAlertMessage("Verification password dissmatch",titleS: "Alert");
            passwordField.text = ""
            verificationPasswordField.text = ""
            
            return
        }
        
        let url = NSURL(string: "http://localhost:8080/ejobs/rest/secured/resultat/all")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            print(NSString(data: data!, encoding: NSUTF8StringEncoding))
        }
        
        task.resume()

        
        let CVImageData = UIImageJPEGRepresentation(CVPhotoImageView.image!, 1)
        
        
        //store data
        
        //NSUserDefaults.standardUserDefaults().setObject(email, forKey: "userEmail");
        //NSUserDefaults.standardUserDefaults().setObject(password, forKey: "userPassword");
        //NSUserDefaults.standardUserDefaults().synchronize();
       /*
        let myURL = NSURL(string: "");
        let request = NSMutableURLRequest(URL: myURL!);
        request.HTTPMethod = "POST" ;
        
        let postString = "email=\(email)&password=\(password)";
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                NSLog("no")
                return;
            }
        
    
        var err: NSError?
       // let json = NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
        
            
            do {
              let json = try NSJSONSerialization.JSONObjectWithData(data!,
                    options: [.MutableContainers]) as! NSDictionary
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        
        
    }
    


    
    
    // pour afficher une boite de message
   
    */
    
    }
}
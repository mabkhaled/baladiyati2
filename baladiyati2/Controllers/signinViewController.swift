//
//  signinViewController.swift
//  baladiyati2
//
//  Created by Mac-Mini-2021 on 22/11/2021.
//

import UIKit
import GoogleSignIn
import Alamofire

class signinViewController: UIViewController {
    
    let URL_USER_REGISTER = "http://127.0.0.1:3306/login"
    
    @IBOutlet weak var emaillogin: UITextField!
    @IBOutlet weak var mdplogin: UITextField!
    
    func promptAction(promptTitle: String, promptText: String){
           
           let alert = UIAlertController(title: promptTitle, message: promptText, preferredStyle: .alert)
           let action = UIAlertAction(title: "OK", style: .default, handler: nil)
           alert.addAction(action)
           self.present(alert, animated: true)
       }
    
    
    @IBAction func seconnecter(_ sender: Any) {
        
        //creating parameters for the post request
                let parameters: Parameters=[
                         
                           "email_user":emaillogin.text!,
                          "password_user": mdplogin.text!
                          
                      ]
        
        
        //Sending http post request

        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
        {
            response in
            //printing response
            print(response)
         var responseData : NSData!
     
         //getting the json value from the server
                     if let result = response.result.value {
                         
                         //converting it as NSDictionary
                  print(result)
        
         if String(result  as! String) == ("User Not Found!!!") {
             self.promptAction(promptTitle: "Erreur!", promptText: "utilisateur introuvable")
             
 }
         else if String(result  as! String) == ("Wrong Password") {
             self.promptAction(promptTitle: "erreur!", promptText: "mot de passe incorrect")
        }
 
         else {
             
             UserDefaults.standard.set(self.emaillogin.text, forKey: "UserEmailConnected")
             UserDefaults.standard.set(1, forKey: "connected")
             
               //modif
       //   let next = self.storyboard?.instantiateViewController(withIdentifier: "homecontroller") as! UIViewController
         //        self.present(next, animated: true, completion: nil)
          //
          self.performSegue(withIdentifier: "home", sender: self)
          
         }
                     }
        }

        
        
    }
    
    
    let signInConfig = GIDConfiguration.init(clientID: "953147401153-064es1ldnglte54dbh00h1djm11ngqp4.apps.googleusercontent.com")
    
    @IBAction func googlecon(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }

            self.performSegue(withIdentifier: "login", sender: self)
          }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
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

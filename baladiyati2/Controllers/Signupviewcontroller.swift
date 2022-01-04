//
//  signUpViewController.swift
//  baladiyati2
//
//  Created by Mac-Mini-2021 on 22/11/2021.
//

import UIKit
import GoogleSignIn
import Alamofire

class signUpViewController: UIViewController{
    
    
    let URL_USER_REGISTER = "http://127.0.0.1:3306/register"
    
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var mdpasse: UITextField!
    @IBOutlet weak var email: UITextField!
    
    func promptAction(promptTitle: String, promptText: String){
        
        let alert = UIAlertController(title: promptTitle, message: promptText, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }

    @IBAction func registerbtn(_ sender: Any) {
 
        
        guard let nom = username.text, !nom.isEmpty else {
                      let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre nom", preferredStyle: UIAlertController.Style.alert)
                       myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
                       self.present(myalert, animated: true)
                                  return                }
              //********************************************
        
        guard let email = email.text, !email.isEmpty else {
                let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre email", preferredStyle: UIAlertController.Style.alert)
                 myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
                 self.present(myalert, animated: true)
                            return                }
        if(isValidEmail(emailID: email) == false )
                {
                    let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer valide email", preferredStyle: UIAlertController.Style.alert)
                     myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
                     self.present(myalert, animated: true)
                }
        
        //********************************************
        
        guard let mdp = mdpasse.text, !mdp.isEmpty else {
                let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre mot de passe", preferredStyle: UIAlertController.Style.alert)
                 myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
                 self.present(myalert, animated: true)
                            return                }
        //********************************************
        
        let parameters: Parameters=[
            "nom_user": nom,
             "email_user": email,
            "password_user": mdp]
        
        
        //Sending http post request
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
        {
            response in
            //printing response
            print(response)
            
         //getting the json value from the server
                    if let result = response.result.value {
                         
                         //converting it as NSDictionary
                        // let jsonData = result as! NSDictionary
                         //alamofire object mapper
                         //displaying the message in label
                       //  self.LabelMessage.text = jsonData.value(forKey: "message") as! String?
                     }
                 
 }
        
        self.performSegue(withIdentifier: "login", sender: self)
                      }
                      
    func isValidEmail(emailID:String) -> Bool {
                  let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
                  let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                 return emailTest.evaluate(with: emailID)
              }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
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

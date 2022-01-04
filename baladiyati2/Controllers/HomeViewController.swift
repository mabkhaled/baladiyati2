//
//  HomeViewController.swift
//  baladiyati2
//
//  Created by Mac-Mini-2021 on 22/11/2021.
//

import UIKit
import GoogleSignIn

class HomeViewController: UIViewController {

    @IBAction func logout(_ sender: Any) {
        GIDSignIn.sharedInstance.signOut()
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

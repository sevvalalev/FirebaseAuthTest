//
//  HomePageViewController.swift
//  TestApp
//
//  Created by Şevval Alev on 11.09.2023.
//

import UIKit
import Firebase

class HomePageViewController: UIViewController {

    static let identifier = "HomePageVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        }catch{
            print("Error")
        }
    }
    
}

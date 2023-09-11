//
//  ViewController.swift
//  TestApp
//
//  Created by Şevval Alev on 9.09.2023.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        if emailTextField.text != "" , passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text ?? "", password: passwordTextField.text ?? "") { data, error in
                if error != nil {
                    self.makeAlert(title: "Error", message: "\(error?.localizedDescription)")
                }else{
                    self.performSegue(withIdentifier: "HomePageVC", sender: nil)
                }
            }
        }else{
            makeAlert(title: "Error", message: "Email and password fields must be filled")
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if emailTextField.text != "", passwordTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text ?? "", password: passwordTextField.text ?? "") { data, error in
                if error != nil {
                    self.makeAlert(title: "Error", message: "\(error?.localizedDescription)")
                }else{
                    self.performSegue(withIdentifier: "HomePageVC", sender: nil)
                }
            }
        }else{
            makeAlert(title: "Error", message: "Email and password fields must be filled")
        }
    }
    
    
    private func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okBtn = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(okBtn)
        self.present(alert, animated: true)
    }
    
}


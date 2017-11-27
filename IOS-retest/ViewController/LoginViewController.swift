//
//  LoginViewController.swift
//  IOS-retest
//
//  Created by Laurence on 27/11/2017.
//  Copyright © 2017 Hetic. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var connectionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        connectionButton.setTitleColor(UIColor.green, for: .normal)
        connectionButton.setTitleColor(UIColor.lightGray, for: .disabled)
        connectionButton.isEnabled = false
        connectionButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        emailTextField.font = UIFont.italicSystemFont(ofSize: 15)
        emailTextField.placeholder = "Email"
        emailTextField.textColor = UIColor.gray
        emailTextField.keyboardType = .emailAddress
        emailTextField.delegate = self
        
        passwordTextField.font = UIFont.italicSystemFont(ofSize: 15)
        passwordTextField.placeholder = "Password"
        passwordTextField.textColor = UIColor.gray
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
    }

    func calculateButtonState(){
        //cette fonction a pour but de savoir si les 2 champs sont remplis
        let emailOptionnel = emailTextField.text
        let passwordOptionnel = passwordTextField.text
        
        var buttonShouldBeActivated = false
        if let email = emailOptionnel,
            let password = passwordOptionnel,
            !email.isEmpty,
            !password.isEmpty {
            buttonShouldBeActivated = true
        }
        connectionButton.isEnabled = buttonShouldBeActivated
    }
    //Au click sur Login
    @IBAction func didTapOnLogin(_ sender: Any) {
        if let controller =
            self.storyboard?.instantiateViewController(withIdentifier: "granted") as? GrantedViewController {
            // Ici le controller existe
            // S'il n'y a pas d'email, donne moi le texte vide
            controller.email = emailTextField.text ?? ""
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Cacher le clavier
        textField.resignFirstResponder()
        return false
    }
    
    //Finir l'édition d'un champ
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        calculateButtonState()
    }
}

//
//  ViewController.swift
//  3m.1dz
//
//  Created by imran on 07.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var users: [User] = [User(username: "Imran", password: "330809"),User(username: "Meerim", password: "020905"),User(username: "Sezim", password: "030506"),User(username: "Ayana", password: "170310")]
    
    var isFound = false
    
    @IBOutlet weak var UsernameTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    @IBAction func SignInTap(_ sender: Any) {
        if UsernameTextField.text! != "" && PasswordTextField.text! != ""{
            for user in users{
                if user.username == UsernameTextField.text! && user.password == PasswordTextField.text!{
                    isFound = true
                    break
                }else{
                    isFound = false
                }
            }
        }else{
            showAlert(message: "Заполните необходимые поля!")
            if UsernameTextField.text! == "" && PasswordTextField.text! == ""{
                UsernameTextField.layer.borderWidth = 1
                UsernameTextField.layer.borderColor = UIColor.red.cgColor
                UsernameTextField.layer.cornerRadius = 6
                UsernameTextField.placeholder = "Enter username!"
                PasswordTextField.layer.borderWidth = 1
                PasswordTextField.layer.borderColor = UIColor.red.cgColor
                PasswordTextField.layer.cornerRadius = 6
                PasswordTextField.placeholder = "Enter password!"
            }else if UsernameTextField.text! == ""{
                UsernameTextField.layer.borderWidth = 1
                UsernameTextField.layer.borderColor = UIColor.red.cgColor
                UsernameTextField.layer.cornerRadius = 6
            }else if PasswordTextField.text! == ""{
                PasswordTextField.layer.borderWidth = 1
                PasswordTextField.layer.borderColor = UIColor.red.cgColor
                PasswordTextField.layer.cornerRadius = 6
            }
            
        }
        if isFound == true{
            showAlert(message: "Вы успешно вошли!")
        }else{
            showAlert(message: "Неверные данные!")
        }
    }
    
    
    @IBAction func SignUpTap(_ sender: Any) {
    }
    
    private func showAlert(message: String){
        let alertController = UIAlertController(title: "Вход", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel){ action in
            self.UsernameTextField.text = ""
            self.PasswordTextField.text = ""
        }
        
        alertController.addAction(okAction)
        
        
        present(alertController,animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}


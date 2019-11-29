//
//  LoginVC.swift
//  Channelier Organisation
//
//  Created by Himanshu Jha on 13/11/19.
//  Copyright © 2019 Himanshu Jha. All rights reserved.
//

import UIKit
import Foundation
import Toast_Swift

class LoginVC: UIViewController {

    var checkBoxNumber = 1
    var iconClick = true
    var emailID = "nil"
    
    func openLink(urlString : String) {
        guard let url = URL(string: urlString) else {
          return //be safe
        }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        else {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var passwordBtn: UITextField!
    
    @IBAction func passwordShow(_ sender: UIButton) {
        if(iconClick == true) {
            passwordBtn.isSecureTextEntry = false
        } else {
            passwordBtn.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        
//        let parameters = ["email":"sandeeppvec@gmail.com","password":"demo"]
//        guard let url = URL(string: " https://dev.channelier.com/index.php?route=feed/rest_api_v2/validateLogin&gcmToken=f94Wm0gGyag:APA91bGIxPBb5MbvXy2qWf4aL70VKtGUEVK8asCCwtOxDs-UHZhacFxBxXwuk2EvZ2ThghbXhAp4hDyppAN9QUP-9w9FmfPQu5GLGPHfI5HyIgP27UYU-x2kcZxmMoPjCMJs0J20vUXv&gcmFlag=0&date=0&key=12345&syncdate=0") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        
//        let session = URLSession.shared
//        session.dataTask(with: url) { (data, response, err) in
//     
//        }.resume()
//        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let controller = storyboard.instantiateViewController(withIdentifier : "HomeViewController" )
         controller.modalPresentationStyle = .fullScreen
        // let navController = UINavigationController (rootViewController: controller)
         self.present(controller, animated: true, completion: nil)
         //self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        openLink(urlString: "https://beta.channelier.com/index.php?route=account/register")
    }
    
    @IBAction func forgotPswAction(_ sender: UIButton) {
        print("Function called")
                let alert = UIAlertController(title: "Forgot Password", message: "Enter the e-mail or mobile number for your account. The password shall be mailed/messaged to you.", preferredStyle: .alert)
                alert.addTextField{ (tf) in tf.placeholder = "Email" }
                let submit = UIAlertAction(title: "Submit", style: .default)
                { (_) in guard let email = alert.textFields?.first?.text
                    else { return }
                    self.emailID = email
                    print(self.emailID)
                    if(self.emailID == "nil" || self.emailID == ""){
                        self.view.makeToast("Invalid Email/Mobile")
                    }
                    else {
                        self.view.makeToast("Invalid Email/Mobile")
                    }
                }
                let cancel = UIAlertAction(title: "Cancel", style: .default)
                alert.addAction(cancel)
                alert.addAction(submit)
                present(alert, animated: true, completion: nil)
    }
    
    @IBAction func websiteAction(_ sender: UIButton) {
        
    }
    
    @IBOutlet weak var checkboxBtn: UIButton!

    @IBOutlet weak var loginBtn: UIButton!
    
    
    @IBAction func checkboxAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.07, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)

        }) { (success) in
            UIView.animate(withDuration: 0.07, delay: 0.1, options: .curveLinear, animations: {
                sender.isSelected = !sender.isSelected

              if sender.isSelected {
                  self.checkBoxNumber = 1
                  print(self.checkBoxNumber)
              }

              else{
                  self.checkBoxNumber = 0
                  print(self.checkBoxNumber)
              }

                sender.transform = .identity
            }, completion: nil)
        }
    }
    
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    
    @IBAction func privacyPolicyAction(_ sender: UIButton) {
        openLink(urlString: "https://beta.channelier.com/index.php?route=information/information/info&information_id=3")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkboxBtn.layer.borderColor = UIColor.white.cgColor
        checkboxBtn.layer.borderWidth = 1
        emailTxtField.layer.cornerRadius = 5
        passwordBtn.layer.cornerRadius = 5
        
        loginBtn.layer.cornerRadius = 5
        emailTxtField.setLeftPaddingPoints(10)
        passwordBtn.setLeftPaddingPoints(10)
        checkboxBtn.setImage(UIImage(named:"CheckBox"), for: .selected)
        checkboxBtn.setImage(UIImage(named:"UncheckedBox"), for: .normal)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

}

extension UITextField {
      func setLeftPaddingPoints(_ amount:CGFloat){
          let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
          self.leftView = paddingView
          self.leftViewMode = .always
      }
      func setRightPaddingPoints(_ amount:CGFloat) {
          let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
          self.rightView = paddingView
          self.rightViewMode = .always
      }
  }

extension String {
    
func isValidEmail() -> Bool {
    // here, `try!` will always succeed because the pattern is valid
    let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
    return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    
var isphoneNumber : Bool {
    do {
        let detector = try NSDataDetector(types:NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
        let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
        if let res = matches.first {
            return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count && self.count == 10
        }
        else {
            return false
        }
    }
    catch {
        return false
        }
    }
    
}

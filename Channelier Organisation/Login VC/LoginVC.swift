//
//  LoginVC.swift
//  Channelier Organisation
//
//  Created by Himanshu Jha on 13/11/19.
//  Copyright © 2019 Himanshu Jha. All rights reserved.
//

import UIKit
import Foundation

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

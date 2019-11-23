//
//  SettingsVC.swift
//  Channelier Organisation
//
//  Created by Himanshu Jha on 14/11/19.
//  Copyright © 2019 Himanshu Jha. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBAction func backBtn(_ sender: UIButton) {
        let transition: CATransition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: nil)
        let mainstoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainstoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label:UILabel = UILabel(frame: CGRect(x: 140, y: 30, width: 150, height: 30))
        label.text = "Settings"
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 22.0)
        self.view.addSubview(label)
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

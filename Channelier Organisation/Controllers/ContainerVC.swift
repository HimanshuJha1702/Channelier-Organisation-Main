//
//  ContainerVC.swift
//  Channelier Organisation
//
//  Created by Himanshu Jha on 15/11/19.
//  Copyright © 2019 Himanshu Jha. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {

    
    @IBOutlet weak var producReport: UIButton!
    @IBOutlet weak var productReport2: UIButton!
    @IBOutlet weak var productReport3: UIButton!
    @IBOutlet weak var productReport4: UIButton!
    @IBOutlet weak var productReport5: UIButton!
    @IBOutlet weak var productReport6: UIButton!
    
    
    @IBAction func productReport(_ sender: UIButton) {
        let transition: CATransition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: nil)
        let mainstoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainstoryboard.instantiateViewController(withIdentifier: "SalesReport") as! SalesReport
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    
    func buttonAttributes (_ button: UIButton ) {
        button.layer.backgroundColor = #colorLiteral(red: 0.2352941176, green: 0.9529411765, blue: 1, alpha: 0.6451137609)
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowRadius = 4.0
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.cornerRadius = 5.0
    }
    
    
    @IBAction func productReport2(_ sender: UIButton) {
    
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        buttonAttributes(producReport)
        buttonAttributes(productReport2)
        buttonAttributes(productReport3)
        buttonAttributes(productReport4)
        buttonAttributes(productReport5)
        buttonAttributes(productReport6)
        
    }

}

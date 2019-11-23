//
//  HomeViewController.swift
//  Channelier Organisation
//
//  Created by Himanshu Jha on 14/11/19.
//  Copyright © 2019 Himanshu Jha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    func performAnimation(transition: CATransition){
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromLeft
    }
    
    @IBOutlet weak var menuButton: UIButton!

    @IBAction func didTapmenu(_ sender: UIButton) {
        
        let mainstoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let menuViewController = mainstoryboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuViewController.modalPresentationStyle = .overCurrentContext
        
        menuViewController.didTapMenuType = { menuType in
             self.transitionToNew(menuType)
        }
//        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }
    
    @IBOutlet weak var topView: UIView!
    
    
    let transition = SlideInTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.backgroundColor = #colorLiteral(red: 0, green: 0.5647058824, blue: 0.8470588235, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    
    func transitionToNew(_ menuType: MenuType) {
        
        topView?.removeFromSuperview()
        switch menuType {
        
            case .home:
//                        guard let HomeViewController = storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else { return }
//                        HomeViewController.modalPresentationStyle = .overCurrentContext
//                        present(HomeViewController, animated: false)
            
                let mainstoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let vc = mainstoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false, completion: nil)
            
            case .profile:
                        let transition: CATransition = CATransition()
                        performAnimation(transition: transition)
                        self.view.window!.layer.add(transition, forKey: nil)
            let mainstoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = mainstoryboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false, completion: nil)
//                        guard let ProfileVC = storyboard?.instantiateViewController(identifier: "ProfileVC") as? ProfileVC else { return }
//                        ProfileVC.modalPresentationStyle = .overCurrentContext
//                        present(ProfileVC, animated: false)
//            
            case .settings:
                        let transition: CATransition = CATransition()
                        performAnimation(transition: transition)
                        self.view.window!.layer.add(transition, forKey: nil)
            
            let mainstoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = mainstoryboard.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false, completion: nil)

            
            
            default :
                        break
            
        }
    }

}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}

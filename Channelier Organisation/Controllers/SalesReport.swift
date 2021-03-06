//
//  SalesReport.swift
//  Channelier Organisation
//
//  Created by Himanshu Jha on 16/11/19.
//  Copyright © 2019 Himanshu Jha. All rights reserved.
//

import UIKit
import WebKit

class SalesReport: UIViewController, WKNavigationDelegate {

    
    let transition = SlideOutTransitionFilter()
    
    @IBAction func didTapMenu(_ sender: UIButton) {
        let mainstoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let FilterTableViewController = mainstoryboard.instantiateViewController(withIdentifier: "FilterTableViewController") as! FilterTableViewController
                FilterTableViewController.modalPresentationStyle = .overCurrentContext
                
                FilterTableViewController.didTapMenuType = { menuType in
                     self.transitionToNew(menuType)
                }
        //        menuViewController.modalPresentationStyle = .overCurrentContext
                FilterTableViewController.transitioningDelegate = self
                present(FilterTableViewController, animated: true)
    }
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var actInd: UIActivityIndicatorView!
    
    @IBAction func backBtn(_ sender: UIButton) {
        let transition: CATransition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        let mainstoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainstoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    @IBAction func reloadButton(_ sender: UIButton){
        webView.reload()
    }
    
    override func viewDidLoad() {
        
        let url = URL(string: "https://dev.channelier.com/index.php?route=report/order/sales&email=sandeeppvec@gmail.com&password=demo&location_app=1")!
        webView.load(URLRequest(url: url))
        webView.addSubview(actInd)
        actInd.startAnimating()
        
        webView.navigationDelegate = self
        actInd.hidesWhenStopped = true
        
        super.viewDidLoad()
        let label:UILabel = UILabel(frame: CGRect(x: self.view.frame.width/3.0 , y: 40, width: 150, height: 30))
        label.text = "Sales Report"
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 22.0)
        self.view.addSubview(label)
        // Do any additional setup after loading the view.
    }
    
    
    func transitionToNew(_ menuType: MenuType2) {
            
            switch menuType {
            
            case .clearFilter:
                print("cleared")
                
            case .dateAdded:
                print("cleared")
    
            case .bySalesman:
                print("cleared")
                
            case .filter1:
                print("cleared")
                
            default :
                        break
                
            }
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        actInd.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.webView.evaluateJavaScript("javascript:(function() { " +
        "var head = document.getElementsByClassName('menu-div col-xs-12 padding_zero')[0].style.display='none';" +
        "})()") { (result, error) in
               if error == nil {
                   // header is hide now
               }
           }
        actInd.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        actInd.stopAnimating()
        print("i am running")
        let alert = UIAlertController(title: "Warning!", message: "Please check you internet connection", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

extension SalesReport: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}


//view.loadUrl;


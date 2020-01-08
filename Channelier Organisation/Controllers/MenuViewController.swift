
//
//  MenuViewController.swift
//  SlideInTransition
//
//  Created by Gary Tokman on 1/12/19.
//  Copyright © 2019 Gary Tokman. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case home
    case profile
    case logout
    
}

class MenuViewController: UITableViewController {

    var didTapMenuType: ((MenuType) -> Void)?
    
    @objc func dismissController () {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menuType = MenuType(rawValue: indexPath.row){
        dismiss(animated: true) { [weak self] in
            print("Dismissing: \(menuType)")
            self?.didTapMenuType?(menuType)
            }
        }
        else {
           let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissController))
           self.view.addGestureRecognizer(tap)
        }
    }
}


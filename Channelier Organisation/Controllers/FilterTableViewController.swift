//
//  FilterTableViewController.swift
//  Channelier Organisation
//
//  Created by Himanshu Jha on 29/11/19.
//  Copyright © 2019 Himanshu Jha. All rights reserved.
//

import UIKit

enum MenuType2: Int {
    case clearFilter
    case dateAdded
    case Status
    case bySalesman
    case filter1
    
}

class FilterTableViewController: UITableViewController{

    var didTapMenuType: ((MenuType2) -> Void)?
    
    @objc func dismissController () {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menuType = MenuType2(rawValue: indexPath.row){
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




       


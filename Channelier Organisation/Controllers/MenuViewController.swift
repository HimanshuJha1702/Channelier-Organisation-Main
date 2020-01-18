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
        var leftRecognizer = UISwipeGestureRecognizer(target: self, action:
#selector(swipeMade(_:)))
   leftRecognizer.direction = .left
var rightRecognizer = UISwipeGestureRecognizer(target: self, action:
#selector(swipeMade(_:)))
   rightRecognizer.direction = .right
   self.view.addGestureRecognizer(leftRecognizer)
   self.view.addGestureRecognizer(rightRecognizer)
    }
    @IBAction func swipeMade(_ sender: UISwipeGestureRecognizer) {
   if sender.direction == .left {
      print("left swipe made")
       self.dismiss(animated: true, completion: nil)
   }
   if sender.direction == .right {
      print("right swipe made")
       self.dismiss(animated: true, completion: nil)
   }
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

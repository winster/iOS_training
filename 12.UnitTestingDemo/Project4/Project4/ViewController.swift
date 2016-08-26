import UIKit

class ViewController: UIViewController {
    
    var nameLabel : UILabel?
    
    func getName(number: Int) -> String {
        switch number {
        case 0:
            return "Winster"
        case 1:
            return "Jose"
        case 2:
            return "MCC"
        default:
            return "Amadeus"
        }
    }
    
    func loadNameLabel(){
        nameLabel = UILabel(frame: CGRectMake(10,10,300,40))
        self.view.addSubview(nameLabel!)
    }
    
    func updateNameLabel(){
        nameLabel!.text = getName(1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadNameLabel()
        updateNameLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


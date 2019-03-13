import UIKit
import UICircularProgressRing

class ViewController: UIViewController, UICircularProgressRingDelegate  {
    

    @IBOutlet weak var ring1: UICircularProgressRingView!
    @IBOutlet weak var ring2: UICircularProgressRingView!
    @IBOutlet weak var ring3: UICircularProgressRingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ring1.animationStyle = kCAMediaTimingFunctionLinear
        ring1.font = UIFont.systemFont(ofSize: 70)
        ring2.fontColor = UIColor.gray
        ring3.maxValue = 10
        
        ring1.delegate = self
        ring2.delegate = self
        
    }
    
    @IBAction func animateTheViews(_ sender: AnyObject) {
        ring1.animationStyle = kCAMediaTimingFunctionLinear
        ring1.setProgress(value: 99, animationDuration: 5, completion: nil)
        
        ring2.setProgress(value: 56, animationDuration: 2) { [unowned self] in
            // Increase it more, and customize some properties
            self.ring2.viewStyle = 4
            self.ring2.setProgress(value: 100, animationDuration: 3) {
                self.ring2.font = UIFont.systemFont(ofSize: 50)
                print("Ring 2 finished")
            }
        }
        ring3.setProgress(value: 6.52, animationDuration: 6)
        
    }
    
    // The delegate method!
    func finishedUpdatingProgress(forRing ring: UICircularProgressRingView) {
        if ring === ring1 {
            print("From delegate: Ring 1 finished")
        } else if ring === ring2 {
            print("From delegate: Ring 2 finished")
        }
    }
    
}


//
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculateBrain = CalculateBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func height(_ sender: UISlider) {
        let heightValue = String(format: "%.2f", sender.value)
        heightLabel.text = "\(heightValue)m"
    }
    
    @IBAction func weight(_ sender: UISlider) {
        let weightValue = String(format: "%.0f" ,sender.value)
        weightLabel.text = "\(weightValue)kg"
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculateBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculateBrain.getBMIValue()
            destinationVC.bmiAdvice = calculateBrain.getAdvice()
            destinationVC.bmiColor = calculateBrain.getColor()
        }
    }
}


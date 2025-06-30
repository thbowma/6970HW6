//
//  ViewController.swift
//  HW6
//
//  Created by Thomas Bowman on 6/29/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var enterAmmount: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var poundSwitch: UISwitch!
    
    @IBOutlet weak var euroSwitch: UISwitch!
    
    @IBOutlet weak var yenSwitch: UISwitch!
    
    @IBOutlet weak var yuanSwitch: UISwitch!

var conv = convertLogic()
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
        // Do any additional setup after loading the view.
    }
    func getUSDAmount() -> Int? {
        guard let text = enterAmmount.text, !text.isEmpty else {
            errorLabel.text = "Please enter a value."
            errorLabel.isHidden = false
            return nil
        }
        
        guard let amount = Int(text) else {
            errorLabel.text = "Please enter a valid integer amount."
            errorLabel.isHidden = false
            return nil
        }
        
        errorLabel.text = ""  // Clear error
        errorLabel.isHidden = true
        return amount
    }
    
    
    @IBAction func converButton(_ sender: Any) {
        guard let usd = getUSDAmount() else {
             return
         }

        conv.usdAmmount = usd
         
        conv.convert(euro: euroSwitch.isOn, pound: poundSwitch.isOn, yen: yenSwitch.isOn, yuan: yuanSwitch.isOn)
        self.performSegue(withIdentifier: "toNav", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toNav" {
            let navigation = segue.destination as! resultViewController
            navigation.euroAmmount = conv.euroAmmount
            navigation.poundAmmount = conv.poundAmmount
            navigation.yenAmmount = conv.yenAmmount
            navigation.yuanAmmount = conv.yuanAmmount
            navigation.usdAmmount = conv.usdAmmount
            
        }
    }
    
}


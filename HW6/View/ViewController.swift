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
    var usdAmmount : Int = 0
    var poundAmmount : Double = -1
    var euroAmmount : Double = -1
    var yenAmmount : Double = -1
    var yuanAmmount : Double = -1
    
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

         usdAmmount = usd
         
         euroAmmount = euroSwitch.isOn ? Double(usd) * 0.89 : -1
         poundAmmount = poundSwitch.isOn ? Double(usd) * 0.73 : -1
         yenAmmount = yenSwitch.isOn ? Double(usd) * 127.94 : -1
         yuanAmmount = yuanSwitch.isOn ? Double(usd) * 7.41 : -1
        self.performSegue(withIdentifier: "toNav", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toNav" {
            let navigation = segue.destination as! resultViewController
            navigation.euroAmmount = euroAmmount
            navigation.poundAmmount = poundAmmount
            navigation.yenAmmount = yenAmmount
            navigation.yuanAmmount = yuanAmmount
            navigation.usdAmmount = usdAmmount
            
        }
    }
    
}


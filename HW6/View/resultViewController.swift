//
//  resultViewController.swift
//  HW6
//
//  Created by Thomas Bowman on 6/30/25.
//

import UIKit

class resultViewController: UIViewController {

    @IBOutlet weak var forthCurrency: UILabel!
    @IBOutlet weak var thirdCurrency: UILabel!
    @IBOutlet weak var secondCurrency: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var firstCurrency: UILabel!
    var usdAmmount = -1
    var poundAmmount :Double = -1
    var euroAmmount :Double = -1
    var yenAmmount :Double = -1
    var yuanAmmount :Double = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        if poundAmmount > 1 {
            firstCurrency.text = "\(poundAmmount) £ (GBP)"
            firstCurrency.isHidden = false
        } else {
            firstCurrency.isHidden = true
        }
        if euroAmmount > 1 {
            secondCurrency.text = "\(euroAmmount), € (EUR)"
            secondCurrency.isHidden = false
        } else {
            secondCurrency.isHidden = true
        }
        if yenAmmount > 1 {
            thirdCurrency.text = "\(yenAmmount) ¥ (JPY)"
            thirdCurrency.isHidden = false
        } else {
            thirdCurrency.isHidden = true
        }
        if yuanAmmount > 1 {
            forthCurrency.text = "\(yuanAmmount) ¥ (CNY)"
            forthCurrency.isHidden = false
        } else {
            forthCurrency.isHidden = true
        }
        
        usdLabel.text = "$ \(usdAmmount) is:"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reurnButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

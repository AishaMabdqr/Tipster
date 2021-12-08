//
//  ViewController.swift
//  Tipster
//
//  Created by A Ab. on 03/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputLabel: UILabel!
    
    
    @IBOutlet weak var minPercent: UILabel!
    @IBOutlet weak var minTip: UILabel!
    @IBOutlet weak var minTotal: UILabel!
    
    @IBOutlet weak var medPercent: UILabel!
    @IBOutlet weak var medTip: UILabel!
    @IBOutlet weak var medTotal: UILabel!
    
    
    @IBOutlet weak var maxPercent: UILabel!
    @IBOutlet weak var maxTip: UILabel!
    @IBOutlet weak var maxTotal: UILabel!
    
    
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var groupSize: UILabel!
    @IBOutlet weak var groupSlider: UISlider!
    
    var totalBill: Float = 0.0
    var inputText: String = ""
    var group: Int = 1
    var senderValue: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        inputLabel.text = "0.00"
    }
    
    
    @IBAction func keyPressed(_ sender: UIButton) {
        if inputLabel.text == "0.00" && sender.tag < 10{
            inputLabel.text = String(sender.tag)
        }
        
       else if sender.tag < 10{
           if let inputText = inputLabel.text {
            inputLabel.text = inputText + String(sender.tag)
           }
        }
        
       else if sender.tag == 12 {
           if let inputText = inputLabel.text {
            inputLabel.text = inputText + "."
           }
       }
        
        else if sender.tag == 11 {
             inputLabel.text = "0"
        }
    }
        
    func calculate(total : Float){

        if let inputText = inputLabel.text{
      
            totalBill = Float(inputText)!
            
            let first = (totalBill * (total + 0.05)) / Float(group)
            minTip.text = String(format: "%.2f", first)
            minTotal.text = String(format: "%.2f", (totalBill + first))
            
            let second = (totalBill * (total + 0.15)) / Float(group)
            medTip.text = String(format: "%.2f", second)
            medTotal.text = String(format: "%.2f", (totalBill + second))
            
            let third = (totalBill * (total + 0.2)) / Float(group)
            maxTip.text = String(format: "%.2f", third)
            maxTotal.text = String(format: "%.2f", (totalBill + third))
            
        
    }
    }
    
    
    @IBAction func tipSlider(_ sender: UISlider) {
        
        minPercent.text = String(format: "%.2f", ((sender.value + 0.05) * 100)) + "%"
        medPercent.text = String(format: "%.2f", ((sender.value + 0.15) * 100)) + "%"
        maxPercent.text = String(format: "%.2f", ((sender.value + 0.2) * 100)) + "%"
        
        calculate(total: sender.value)
    }
    
    @IBAction func groupSlider(_ sender: UISlider) {
        groupSize.text = "\(Int(sender.value.rounded()))"
        group = Int(sender.value.rounded())
        calculate(total: sender.value)
    }
}


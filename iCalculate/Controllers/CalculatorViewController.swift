//
//  CalculatorViewController.swift
//  iCalculate
//
//  Created by Brando Flores on 12/10/20.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    private var isFinishedTypingNumber: Bool = true
    private var userHasPressedDecimal: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert label text to a double.")
        }
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "AC" {
                displayLabel.text = "0"
            }
            else if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            }
            else if calcMethod == "%" {
                displayLabel.text = String(number / 100.00)
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }
            else {
                if numValue == "." {
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("Cannot convert display label text to a Double!")
                    }
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text?.append(numValue)
            }
        }
        
    }
    

}

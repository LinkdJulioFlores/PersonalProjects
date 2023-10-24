//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class CalculatorViewController: UIViewController {
    /*
     For future practice:
        Update UI to my style
        Change CalculatorViewController button style to match segue
        Use of struct in CalculateBrain for data storage
     */
    
    //Set with default values
    //Struct implementation for easier readability is in thought
    var calculateBrain = CalculateBrain(tipPercent: 0.10, billTotal: 20, numberOfPeople: 1, calculatedAnswer: 1.0)
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var billTextField: UITextField!
    
    //Constructor
    override func viewDidLoad() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        billTextField.text = "0"
        tenPctButton.isSelected = true
        splitNumberLabel.text = "1"
        //Handles dismisal of keyboard when tap out of UITextField
        view.addGestureRecognizer(tapGesture)
    }
    
    //Needs to update UI and calculate brain tip percentage
    @IBAction func tipChanged(_ sender: UIButton) {
        //Updates UI
        updateButtonUI()
        sender.isSelected = true
        //Handles which percantage is chosen for calculations
        calculateBrain.passPctButton(sender)
    }
    //Needs to update UI value and struct
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        //Updates UI
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        //Updates calculateBrain
        calculateBrain.setNumberOfPeople(Int(sender.value))
    }
    //Needs to grab all values and calculate so that answer can get sent to destination
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculateBrain.setBillTotal(billTextField.text!)
        //This has all values set to a specific number
        calculateBrain.calculate()
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    //Updates button UI
    func updateButtonUI(){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    //Self Exaplanatory
    @objc func dismissKeyboard(){
        billTextField.resignFirstResponder()
    }
    //Handles segue init values
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.displayCalculatedAnswer = calculateBrain.getCalculatedAnswerString()
            destinationVC.displayText = calculateBrain.getSentence()
        }
    }
}


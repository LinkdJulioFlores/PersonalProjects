//
//  CalculateBrain.swift
//  Tipsy
//
//  Created by Julio Flores on 10/22/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct CalculateBrain {
    var tipPercent: Float
    var billTotal: Float
    var numberOfPeople: Int
    var calculatedAnswer: Float
    
    //Calculates intended and desired output on segue
    mutating func calculate() {
        calculatedAnswer = (billTotal * tipPercent) / Float(numberOfPeople)
    }
    
    //For next segue to attain the sentence
    func getSentence() -> String {
        return "Split between \(numberOfPeople) people, with a \(Int(tipPercent*100))% tip."
    }
    
    //Handles what percent to be used when calculate is called
    mutating func passPctButton (_ myPctButton: UIButton){
        switch myPctButton.currentTitle {
        case "0%":
            self.tipPercent = 0.0
        case "10%":
            self.tipPercent = 0.10
        default:
            self.tipPercent = 0.2
        }
    }
    
    //Self explanatory
    func getCalculatedAnswerString() -> String {
        return String(format: "$%.2f", calculatedAnswer)
    }
    
    //Gets the UITextField.text and turns it to Float
    mutating func setBillTotal(_ number: String) {
        let numberFormatter = NumberFormatter()
        let number = numberFormatter.number(from: number)
        let numberFloatValue = number?.floatValue
        billTotal = numberFloatValue ?? 1.0
    }
    
    //Self explanatory
    mutating func setNumberOfPeople(_ numberOfPeople: Int) {
        self.numberOfPeople = numberOfPeople
    }
    
    //Getters for debugging purposes
    func getCurrentTipPercent() -> Float { return tipPercent }
    func getCurrentBillTotal() -> Float { return billTotal }
    func getCurrentNumberOfPeople() -> Int { return numberOfPeople }
    func getAnswer() -> Float { return calculatedAnswer }
}

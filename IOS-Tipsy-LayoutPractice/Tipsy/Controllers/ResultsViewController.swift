//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Julio Flores on 10/22/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var displayText: String?
    var displayCalculatedAnswer: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsLabel.text = displayText
        totalLabel.text = displayCalculatedAnswer
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
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

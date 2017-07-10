//
//  ViewController.swift
//  iOS-NinjaGold
//
//  Created by John Colley on 7/10/17.
//  Copyright © 2017 John Colley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalGold: UILabel!
    @IBOutlet weak var farmGoldAdded: UILabel!
    @IBOutlet weak var caveGoldAdded: UILabel!
    @IBOutlet weak var houseGoldAdded: UILabel!
    @IBOutlet weak var casinoGoldAdded: UILabel!
    
    var goldTotal: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func bldgButtonPressed(_ sender: UIButton) {
        // Loop through all labels each time bldg button is pressed and hide all (except Gold and Total Gold, tagged with 1)
        hideLabels()
        
        if sender.tag == 1 {
            let lowerValue = 10
            let upperValue = 50
            let gold = Int(arc4random_uniform(UInt32(upperValue - lowerValue + 1))) + lowerValue
            goldTotal += gold
            updateTotal(gold: goldTotal)
            farmGoldAdded.text = "You earned \(gold)"
            farmGoldAdded.isHidden = false
        } else if sender.tag == 2 {
            let lowerValue = 5
            let upperValue = 10
            let gold = Int(arc4random_uniform(UInt32(upperValue - lowerValue + 1))) + lowerValue
            goldTotal += gold
            updateTotal(gold: goldTotal)
            caveGoldAdded.text = "You earned \(gold)"
            caveGoldAdded.isHidden = false
        } else if sender.tag == 3 {
            let lowerValue = 2
            let upperValue = 5
            let gold = Int(arc4random_uniform(UInt32(upperValue - lowerValue + 1))) + lowerValue
            goldTotal += gold
            updateTotal(gold: goldTotal)
            houseGoldAdded.text = "You earned \(gold)"
            houseGoldAdded.isHidden = false
        } else if sender.tag == 4 {
            let lowerValue = -50
            let upperValue = 50
            let gold = Int(arc4random_uniform(UInt32(upperValue - lowerValue + 1))) + lowerValue
            goldTotal += gold
            updateTotal(gold: goldTotal)
            var wiggle = ""
            if gold < 0 {
                wiggle = "lost"
            } else if gold >= 0 {
                wiggle = "earned"
            }
            casinoGoldAdded.text = "You \(wiggle) \(gold)"
            casinoGoldAdded.isHidden = false
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        goldTotal = 0
        updateTotal(gold: goldTotal)
        hideLabels()
    }
    
    func updateTotal(gold: Int){
        totalGold.text = String(gold)
    }
    
    func hideLabels(){
        for view in self.view.subviews as [UIView] {
            if let lbl = view as? UILabel {
                if lbl.tag != 1{
                    lbl.isHidden = true
                }
            }
        }
    }
}


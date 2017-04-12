//
//  ViewController.swift
//  Calculator
//
//  Created by Rodrigo Fernandes bulgarelli on 12/04/17.
//  Copyright © 2017 Rodrigo Fernandes bulgarelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInMiddleOfTying = false
    
    var displayValue: Double{
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInMiddleOfTying {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsInMiddleOfTying = true
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInMiddleOfTying = false
        if let mathemathicalOperation = sender.currentTitle {
            switch mathemathicalOperation {
            case "π":
                displayValue = Double.pi
            case "√":
                displayValue = sqrt(displayValue)
            default:
                break
            }
        }
    }
}


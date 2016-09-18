//
//  ViewController.swift
//  TipCalculator
//
//  Created by Raj Sathyaseelan on 9/17/16.
//  Copyright © 2016 Token. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipprecentSegment: UISegmentedControl!
    
    let tipPercentages = [0.125, 0.150,0.175, 0.20, 0.225]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        resetSegment()
        
    }
    
    /*
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        print("View will appear")
        resetSegment()
    }
    */
    
    override func viewDidAppear(_ animated: Bool) {
    
        super.viewDidAppear(animated)
        print("View did appear")
        resetSegment()
    }

    
    func resetSegment() {
        
        let defaults = UserDefaults.standard
        let doubleValue = defaults.double(forKey: "defaultTip")

        
        print("Reset Segment: \(doubleValue)")
        
        switch "\(doubleValue)"
        {
        case "0.125":
            tipprecentSegment.selectedSegmentIndex = 0
        case "0.15":
            tipprecentSegment.selectedSegmentIndex = 1
        case "0.175":
            tipprecentSegment.selectedSegmentIndex = 2
        case "0.20":
            tipprecentSegment.selectedSegmentIndex = 3
        case "0.225":
            tipprecentSegment.selectedSegmentIndex = 4
        default:
            tipprecentSegment.selectedSegmentIndex = 1
            break;
        }
        
        calculateTip("")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        print("Hello")
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        print( "recalculating tip")
        let bill = Double(billField.text!) ?? 0
        
        
        let tip = bill * tipPercentages[tipprecentSegment.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = "\(String(format: "$%.2f", tip))"
        totalLabel.text = "\(String(format: "$%.2f", total))"

    }
    
}


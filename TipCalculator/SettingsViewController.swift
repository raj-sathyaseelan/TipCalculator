//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Raj Sathyaseelan on 9/17/16.
//  Copyright © 2016 Token. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var tipDefaultLabel: UILabel!
    @IBOutlet weak var tipStepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let defaults = UserDefaults.standard
        //let stringValue = defaults.object(forKey: "some_key_that_you_choose") as! String
        //let intValue = defaults.integer(forKey: "another_key_that_you_choose")
        
        
        //defaults.set(0.15, forKey: "defaultTip")
        let doubleValue = defaults.double(forKey: "defaultTip")
        print( "DoubleValue : \(doubleValue)")
        tipDefaultLabel.text = "\(doubleValue*100)%"
        
        tipStepper.value = doubleValue * 100

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tipStepperValueChange(_ sender: AnyObject) {
        
        tipDefaultLabel.text = "\(tipStepper.value)%"
        let defaults = UserDefaults.standard
        
        defaults.set((tipStepper.value/100), forKey: "defaultTip")
        
        
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

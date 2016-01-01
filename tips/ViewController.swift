//
//  ViewController.swift
//  tips
//
//  Created by Kevin Tran on 12/13/15.
//  Copyright © 2015 Kevin Tran. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITextFieldDelegate {
    
    //Make local variable for 3 tips

    @IBOutlet weak var billInput: UITextField!
    @IBOutlet weak var tipDisplay: UILabel!
    @IBOutlet weak var totalDisplay: UILabel!
    @IBOutlet weak var tipChoice: UISegmentedControl!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
//        self.billInput.delegate = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        tipChange()
        print("User editing Bill")
        var tipPercentages = SettingsViewController.myVariables.tipPercentages
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if let tip1Value = defaults.objectForKey("tip1Key"){
            SettingsViewController.myVariables.tipPercentages[0] = tip1Value as! Double
            tipChoice.setTitle(String(format: "%.0f%%",(tip1Value as! Double)*100), forSegmentAtIndex: 0)

        } else {
            tipChoice.setTitle(String(format: "%.0f%%",tipPercentages[0]*100), forSegmentAtIndex: 0)
        }
        
        if let tip2Value = defaults.objectForKey("tip2Key"){
            SettingsViewController.myVariables.tipPercentages[1] = tip2Value as! Double
            tipChoice.setTitle(String(format: "%.0f%%",(tip2Value as! Double)*100), forSegmentAtIndex: 1)

        } else {
            tipChoice.setTitle(String(format: "%.0f%%",tipPercentages[1]*100), forSegmentAtIndex: 1)
        }
        
        if let tip3Value = defaults.objectForKey("tip3Key"){
            SettingsViewController.myVariables.tipPercentages[2] = tip3Value as! Double
            tipChoice.setTitle(String(format: "%.0f%%",(tip3Value as! Double)*100), forSegmentAtIndex: 2)

        } else {
            tipChoice.setTitle(String(format: "%.0f%%",tipPercentages[2]*100), forSegmentAtIndex: 0)
        }
        
        
        
        let tipPercentage = tipPercentages[tipChoice.selectedSegmentIndex]
        
        let billAmount = NSString(string: billInput.text!).doubleValue
        
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipDisplay.text = String(format: "$%.2f", tip)
        totalDisplay.text = String(format: "$%.2f", total)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func amountChanged(sender: AnyObject) {
        print("User editing Bill")
        
        var tipPercentages = SettingsViewController.myVariables.tipPercentages
        tipChoice.setTitle(String(format: "%.0f%%",tipPercentages[0]*100), forSegmentAtIndex: 0)
        tipChoice.setTitle(String(format: "%.0f%%",tipPercentages[1]*100), forSegmentAtIndex: 1)
        tipChoice.setTitle(String(format: "%.0f%%",tipPercentages[2]*100), forSegmentAtIndex: 2)
        
        let tipPercentage = tipPercentages[tipChoice.selectedSegmentIndex]
        
        let billAmount = NSString(string: billInput.text!).doubleValue
        
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipDisplay.text = String(format: "$%.2f", tip)
        totalDisplay.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    private func tipChange(){
    
        var tipPercentages = SettingsViewController.myVariables.tipPercentages
        tipChoice.setTitle(String(format: "%.0f%%",tipPercentages[0]*100), forSegmentAtIndex: 0)
        tipChoice.setTitle(String(format: "%.0f%%",tipPercentages[1]*100), forSegmentAtIndex: 1)
        tipChoice.setTitle(String(format: "%.0f%%",tipPercentages[2]*100), forSegmentAtIndex: 2)
    }
//    func textFieldDidBeginEditing(textField: UITextField) {
//        self.billInput.selectedTextRange = self.billInput.textRangeFromPosition(self.billInput.beginningOfDocument, toPosition: self.billInput.endOfDocument)
//    }
}


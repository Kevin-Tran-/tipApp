//
//  SettingsViewController.swift
//  tips
//
//  Created by Kevin Tran on 12/15/15.
//  Copyright © 2015 Kevin Tran. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tip1Field: UITextField!
    @IBOutlet weak var tip2Field: UITextField!
    @IBOutlet weak var tip3Field: UITextField!
    
    //let tip1Value = defaults.setObject(tip1, forKey: "tip1Key")

    
    struct myVariables{
        static var tipPercentages = [0.12, 0.15, 0.18]
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        let defaults = NSUserDefaults.standardUserDefaults()
        if let tip1Value = defaults.objectForKey("tip1Key"){
        myVariables.tipPercentages[0] = tip1Value as! Double
        }
        
        if let tip2Value = defaults.objectForKey("tip2Key"){
            myVariables.tipPercentages[1] = tip2Value as! Double
        }
        if let tip3Value = defaults.objectForKey("tip3Key"){
            myVariables.tipPercentages[2] = tip3Value as! Double
        }

        
        tip1Field.text = String(format: "%.0f%",myVariables.tipPercentages[0]*100)
        tip2Field.text = String(format: "%.0f%",myVariables.tipPercentages[1]*100)
        tip3Field.text = String(format: "%.0f%",myVariables.tipPercentages[2]*100)
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
    

    @IBAction func onValueChange(sender: AnyObject) {
        let tip1 = NSString(string: tip1Field.text!).doubleValue / 100
        let tip2 = NSString(string: tip2Field.text!).doubleValue / 100
        let tip3 = NSString(string: tip3Field.text!).doubleValue / 100
        myVariables.tipPercentages = [tip1, tip2, tip3]
        
        print("Tip = ",myVariables.tipPercentages)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(tip1, forKey: "tip1Key")
        defaults.setObject(tip2, forKey: "tip2Key")
        defaults.setObject(tip3, forKey: "tip3Key")

        defaults.synchronize()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

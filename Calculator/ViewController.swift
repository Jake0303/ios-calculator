//
//  ViewController.swift
//  Calculator
//
//  Created by student on 2016-02-02.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var operationString = String()
    @IBOutlet weak var calculatorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetButtonClicked(sender: AnyObject) {
        operationString = ""
        calculatorLabel.text = "0"
        
    }
    @IBAction func buttonClicked(sender: AnyObject) {
        if(sender.currentTitle != "=")
        {
            operationString = operationString + sender.currentTitle!!
        }
        
        calculatorLabel.text = operationString
        
        if(sender.currentTitle == "=")
        {
            var fixedString = operationString.stringByReplacingOccurrencesOfString("x", withString:"*")
            fixedString = fixedString.stringByReplacingOccurrencesOfString("÷", withString: "/")
            let expn = NSExpression(format:fixedString)
            var result = Float();
            result = expn.expressionValueWithObject(nil, context: nil) as! Float
            print(result)
            calculatorLabel.text = String(result)
            operationString = calculatorLabel.text!
        }
    }
   
    
    
    

}


//
//  ViewController.swift
//  Calculator
//
//  Created by student on 2016-02-02.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Variables
    var operationString = String()
    var validOperators: Array<Character> = ["x","+","-","÷"]
    var isFirst = true
    @IBOutlet weak var calculatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Check if the last character in the operation string is a operator, if so then return true
    func checkOperator() -> Bool
    {
        if(!operationString.isEmpty)
        {
            for j in validOperators
            {
                if operationString[operationString.endIndex.predecessor()] == j
                {
                    return true
                }
            }
        }
        return false
    }
    //When the reset button is clicked, reset the text to 0
    @IBAction func resetButtonClicked(sender: AnyObject) {
        operationString = ""
        calculatorLabel.text = "0"
        isFirst = true
    }
    @IBAction func buttonClicked(sender: AnyObject) {
        var isOperator = false
        
        for j in validOperators
        {
                if(Character(sender.currentTitle!!) == j)
                {
                    isOperator = true
                }
        }
        
        if(sender.currentTitle != "=" && ((isOperator && !checkOperator() && !isFirst) || !isOperator || (isOperator && !isFirst)))
        {
            operationString = operationString + sender.currentTitle!!
            calculatorLabel.text = operationString
            isFirst = false
        }
        else
        {
            calculatorLabel.text = "0"
        }
        
        
        
        if(sender.currentTitle == "="  && !checkOperator() && !operationString.isEmpty)
        {
                var fixedString = operationString.stringByReplacingOccurrencesOfString("x", withString:"*")
                fixedString = fixedString.stringByReplacingOccurrencesOfString("÷", withString: "/")
                let expn = NSExpression(format:fixedString)
                var result = Float();
                result = expn.expressionValueWithObject(nil, context: nil) as! Float
                calculatorLabel.text = String(result)
                operationString = calculatorLabel.text!
        }
    }
}


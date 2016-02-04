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

    @IBAction func buttonClicked(sender: AnyObject) {
        operationString = operationString + sender.currentTitle!!
        calculatorLabel.text = operationString
        
        if(sender.currentTitle == "=")
        {
        let stringWithMathematialOperation: String = operationString
        let exp: NSExpression = NSExpression(format: stringWithMathematialOperation)
        let result: Double = exp.expressionValueWithObject(nil,context: nil) as! Double
        
        
        calculatorLabel.text = String(result)
        }
    }
   
    
    
    

}


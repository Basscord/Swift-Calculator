//
//  ViewController.swift
//  Calculator
//
//  Created by Brian Mau on 6/6/17.
//  Copyright © 2017 UenMe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false;
    var operation = "";
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btnClear: UIButton!
    @IBOutlet weak var btnDivide: UIButton!
    @IBOutlet weak var btnMultiply: UIButton!
    @IBOutlet weak var btnSubtract: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnEqual: UIButton!
    @IBAction func numbers(_ sender: UIButton) {
        var val = 0;
        switch sender {
            case btn0:
                val = 0;
            case btn1:
                val = 1;
            case btn2:
                val = 2;
            case btn3:
                val = 3;
            case btn4:
                val = 4;
            case btn5:
                val = 5;
            case btn6:
                val = 6;
            case btn7:
                val = 7;
            case btn8:
                val = 8;
            case btn9:
                val = 9;
            default: fatalError();
        }
        if performingMath == true {
            label.text = String(val);
            numberOnScreen = Double(label.text!)!;
            performingMath = false;
        } else {
            guard let text: String = label.text else { return; }
            label.text = text + String(val);
            guard let textOnScreen: String = label.text else { return; }
            numberOnScreen = Double(textOnScreen)!;
        }
    }

    @IBAction func buttons(_ sender: UIButton) {
        switch sender {
            case btnClear:
                operation = "";
            case btnAdd:
                operation = "+";
            case btnMultiply:
                operation = "X";
            case btnDivide:
                operation = "/";
            case btnSubtract:
                operation = "-";
            case btnEqual:
                switch operation {
                    case "+":
                        label.text = String(previousNumber + numberOnScreen);
                    case "-":
                        label.text = String(previousNumber - numberOnScreen);
                    case "X":
                        label.text = String(previousNumber * numberOnScreen);
                    case "/":
                        label.text = String(previousNumber / numberOnScreen);
                    default: fatalError();
                }
            default: fatalError();
        }
        
        switch sender {
            case btnClear:
                numberOnScreen = 0;
                previousNumber = 0;
                label.text = "";
                performingMath = false;
            case btnEqual:
                guard let text:String = label.text else { return; }
                numberOnScreen = Double(text)!;
                performingMath = false;
                previousNumber = 0;
                operation = "";
            default:
                guard let text:String = label.text else { return; }
                previousNumber = Double(text)!;
                label.text = operation;
                performingMath = true;
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
}


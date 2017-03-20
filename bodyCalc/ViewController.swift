//
//  ViewController.swift
//  bodyCalc
//
//  Created by Belinda Wong on 2/13/17.
//  Copyright © 2017 Belinda Wong. All rights reserved.
//  picture taken from this website https://pixabay.com/en/stick-man-stickman-stick-figure-34978/

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var dispTextField: UITextField!
    
    //MARK: global variables
    var height:Float = 0, weight = 0, bmiRange:Float = 0.0
    var disp:String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Handle the text field's user input through delegate callbacks.
        weightTextField.delegate = self
        heightTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }

    //MARK: Actions
    @IBAction func converterSwitch(_ sender: UISwitch) {
        if sender.isOn{
            //empties out the text field after switching the button
            heightTextField.text = ""
            weightTextField.text = ""
            
            //displays the placeholder text
            heightTextField.placeholder = "in meters"
            weightTextField.placeholder = "in kilograms"
            
            //calculates the BMI and compares it to value in switch
            bmiRange = Float(weight / Int(height*height))
            
            //each case sets string disp to whatever category
            switch bmiRange{
            case _ where bmiRange < 16.0:
                disp = "Severe Thinness"
            case 16..<16.99:
                disp = "Moderate Thinness"
            case 17..<18.49:
                disp = "Mild thinness"
            case 18.5..<24.99:
                disp = "Normal range"
            case 25..<29.99:
                disp = "Overweight"
            case 30..<34.99:
                disp = "Obese Class I (Moderate)"
            case 35..<39.99:
                disp = "Obese Class II (Severe)"
            case _ where bmiRange > 40:
                disp = "Obese Class III (Very Severe)"
            default:
                disp = "Not a valid height and weight"
            }
            
        }
        else{
            //empties out the text field after switching the button
            heightTextField.text = ""
            weightTextField.text = ""
            
            //displays the placeholder text
            heightTextField.placeholder = "in feet"
            weightTextField.placeholder = "in pounds"
            
            //each case sets string disp to whatever category
            bmiRange = Float(weight / Int(height*height))
            
            //1 m = 3.3 ft and 1 kg = 2.2 lb
            //x kg/m^2 = y*2.2/3.3^2 lb/ft^2
            //converted all the values for lbs and feet
            switch bmiRange{
            case _ where bmiRange < 3.2:
                disp = "Severe Thinness"
            case 3.2..<3.4:
                disp = "Moderate Thinness"
            case 3.4..<3.7:
                disp = "Mild thinness"
            case 3.7..<5.04:
                disp = "Normal range"
            case 5.04..<6.06:
                disp = "Overweight"
            case 6.06..<7.07:
                disp = "Obese Class I (Moderate)"
            case 7.07..<8.08:
                disp = "Obese Class II (Severe)"
            case _ where bmiRange > 8.08:
                disp = "Obese Class III (Very Severe)"
            default:
                disp = "Not a valid height and weight"
            }
        }
    }
    
    @IBAction func calcButton(_ sender: UIButton) {
        //getting input from both text fields
        dispTextField.text = ""
        height = Float(heightTextField.text!)!
        weight = Int(weightTextField.text!)!
        dispTextField.text = disp
    }
    

}


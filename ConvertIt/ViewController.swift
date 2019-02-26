//
//  ViewController.swift
//  ConvertIt
//
//  Created by user150412 on 2/25/19.
//  Copyright © 2019 user150412. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var FromUnitsLabel: UILabel!
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var formulaPicker: UIPickerView!
    
    var formulaArray=["Miles to Kilometers",
                      "Kilometers to Miles",
                      "Feet to Meters",
                      "Yards to Meters",
                      "Meters to Feet",
                      "Meters to Yards"]
    var fromUnits=""
    var toUnits=""
    var conversionString=""
    override func viewDidLoad() {
        super.viewDidLoad()
        formulaPicker.delegate=self
        formulaPicker.dataSource=self

    }
    func calcuLateConvert(){
        
        var outputValue=0.0
        if let inputValue=Double(userInput.text!){
            switch conversionString{
            case "Miles to Kilometers":
            outputValue=inputValue/0.62137
            case "Kilometers to Miles":
            outputValue=inputValue*0.62137
            case "Feet to Meters":
            outputValue=inputValue/3.2808
            case "Yards to Meters":
            outputValue=inputValue/1.0936
            case "Meters to Feet":
            outputValue=inputValue*3.2808
            case "Meters to Yards":
            outputValue=inputValue/0.62137
            default:
            outputValue=0
            
        }
        }
        else{
            print("value is not a number")
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return formulaArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return formulaArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let unitsArray=formulaArray[row].components(separatedBy: " to ")
        conversionString=formulaArray[row]
        fromUnits=unitsArray[0]
        toUnits=unitsArray[1]
        
        FromUnitsLabel.text=fromUnits
        calcuLateConvert()
    }
}


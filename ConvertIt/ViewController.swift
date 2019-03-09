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
    @IBOutlet weak var decimalSegment: UISegmentedControl!
    
    
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
        formulaPicker.delegate = self
        formulaPicker.dataSource = self
        conversionString=formulaArray[formulaPicker.selectedRow(inComponent: 0)]

    }
    func calcuLateConvert(){
        guard let inputValue=Double(userInput.text!) else{
            print("Entered value is not a number")
            return
        }
        var outputValue=0.0
        
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
            print("no convertable string")
            
        }
        let formatString=(decimalSegment.selectedSegmentIndex<decimalSegment.numberOfSegments-1 ? "%.\(decimalSegment.selectedSegmentIndex+1)f" : "%f")
        let outputString = String(format: formatString, outputValue)
        resultsLabel.text = "\(inputValue) \(fromUnits) = \(outputString) \(toUnits)"
        }
    
    @IBAction func decimalSelect(_ sender: Any) {
        calcuLateConvert()
    }
    
   
    @IBAction func convertButtonPressed(_ sender: UIButton) {
        calcuLateConvert()
    }
}
extension ViewController:UIPickerViewDelegate ,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
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

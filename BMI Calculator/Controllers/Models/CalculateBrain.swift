//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by Lakshay Bhatia on 13/12/20.
//

import UIKit

struct CalculateBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / (height * height)
    
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more Pies", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }
        else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle", color: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))
        }
        else {
            bmi = BMI(value: bmiValue, advice: "Eat less Pies", color: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
        }
    }
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return String(bmi?.advice ?? "No advice")
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    }
}

//
//  ContentViewModel.swift
//  UnitConversions
//
//  Created by Roman Indermühle on 12.09.23.
//

import Foundation

enum Temperature: String, CaseIterable {
    case Celsius
    case Fahrenheit
    case Kelvin
}

class ContentViewModel: ObservableObject {
    @Published var inputUnit: Temperature = .Celsius
    @Published var outputUnit: Temperature = .Celsius
    
    
    func convertUnit(number: Double) -> String {
        var returnValue: Double = 0
        if inputUnit == .Celsius && outputUnit == .Celsius {
            returnValue = number
            return String(returnValue) + " °C"
        }
        if inputUnit == .Celsius && outputUnit == .Fahrenheit {
            returnValue = round(((number * 9/5) + 32) * 100) / 100.0
            return String(returnValue) + " °F"
        }
        if inputUnit == .Celsius && outputUnit == .Kelvin {
            returnValue = round((number + 273.15) * 100) / 100.0
            return String(returnValue) + " K"
        }
        if inputUnit == .Fahrenheit && outputUnit == .Celsius {
            returnValue = round(((number - 32) * 5/9) * 100) / 100.0
            return String(returnValue) + " °C"
        }
        if inputUnit == .Fahrenheit && outputUnit == .Kelvin {
            returnValue = round(((number - 32) * 5/9 + 273.15) * 100) / 100.0
            return String(returnValue) + "K"
        }
        if inputUnit == .Fahrenheit && outputUnit == .Fahrenheit {
            returnValue = number
            return String(returnValue) + " °F"
        }
        if inputUnit == .Kelvin && outputUnit == .Celsius {
            returnValue = round((number - 273.15) * 100) / 100.0
            return String(returnValue) + " °C"
        }
        if inputUnit == .Kelvin && outputUnit == .Fahrenheit {
            returnValue = round(((number - 273.15) * 9/5 + 32) * 100) / 100.0
            return String(returnValue) + " °F"
        }
        if inputUnit == .Kelvin && outputUnit == .Kelvin {
            returnValue = number
            return String(returnValue) + " K"
        }
        return String(returnValue)
    }
    
}

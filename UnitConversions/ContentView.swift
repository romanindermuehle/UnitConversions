//
//  ContentView.swift
//  UnitConversions
//
//  Created by Roman Indermühle on 06.09.23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    
    @State var inputUnit: Temperature = .Celsius
    @State var outputUnit: Temperature = .Celsius
    
    var body: some View {
//        Self._printChanges()
       NavigationView {
            Form {
                Section {
                    Text("Select input unit")
                        .font(.headline)
                    Picker("Convert", selection: $inputUnit) {
                        ForEach(Temperature.allCases, id: \.self) { temperature in
                            Text(temperature.rawValue)
                        }
                    }.pickerStyle(.segmented)
                    Text("Select output unit")
                        .font(.headline)
                    Picker("To", selection: $outputUnit) {
                        ForEach(Temperature.allCases, id: \.self) { temperature in
                            Text(temperature.rawValue)
                        }
                    }.pickerStyle(.segmented)
                }
                Section {
                    Text("Value")
                        .font(.headline)
                    HStack {
                        TextField("Enter value", value: $inputValue, format: .number)
                            .keyboardType(.decimalPad)
                    }
                }
                Section {
                    Text("Result")
                        .font(.headline)
                    Text(String(format: "%.2f", outputValue))
                }
                
            }
            .navigationTitle("Unit Conversion 🥶")
        }
    }
    
    enum Temperature: String, CaseIterable {
        case Celsius
        case Fahrenheit
        case Kelvin
    }
    
    var inputInCelsius: Double {
        switch inputUnit {
        case .Celsius:
            return inputValue
        case .Fahrenheit:
            return (inputValue - 32) * 5/9
        case .Kelvin:
            return inputValue - 273.15
        }
    }
    
    var outputValue: Double {
        switch outputUnit {
        case .Celsius:
            return inputInCelsius
        case .Fahrenheit:
            return (inputInCelsius * 9/5) + 32
        case .Kelvin:
            return inputInCelsius + 273.15
            
        }
    }
}

#Preview {
    ContentView()
}

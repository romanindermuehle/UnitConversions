//
//  ContentView.swift
//  UnitConversions
//
//  Created by Roman Indermühle on 06.09.23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = ""
    @State private var result = ""
    
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Select units")
                        .font(.headline)
                    Picker("Convert", selection: $viewModel.inputUnit) {
                        ForEach(Temperature.allCases, id: \.self) { temperature in
                            Text(temperature.rawValue)
                        }
                    }
                    Picker("To", selection: $viewModel.outputUnit) {
                        ForEach(Temperature.allCases, id: \.self) { temperature in
                            Text(temperature.rawValue)
                        }
                    }
                }
                Section {
                    Text("Value")
                        .font(.headline)
                    HStack {
                        TextField("Enter value", text: $inputNumber)
                            .onChange(of: inputNumber) {
                                result = viewModel.convertUnit(number: Double(inputNumber) ?? 0)
                                print(result)
                            }
                            .onChange(of: viewModel.inputUnit) {
                                result = viewModel.convertUnit(number: Double(inputNumber) ?? 0)
                                print(result)
                            }
                            .onChange(of: viewModel.outputUnit) {
                                result = viewModel.convertUnit(number: Double(inputNumber) ?? 0)
                                print(result)
                            }
                            .keyboardType(.decimalPad)
                    }
                }
                Section {
                    Text("Result")
                        .font(.headline)
                    Text("\(result)")
                }
                
            }
            .navigationTitle("Unit Conversion")
        }
    }
}

#Preview {
    ContentView()
}

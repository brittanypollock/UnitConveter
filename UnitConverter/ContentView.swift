//
//  ContentView.swift
//  UnitConverter
//
//  Created by Brittany Pollock on 1/17/26.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTemp = "0"
    @State private var choosenUnit = "Celsius"
    @FocusState private var tempIsFocused: Bool
    
    let units = ["Celsius", "Kelvin"]
    
    func fahrToCelcius(temp: Double) -> Double {
        return (temp - 32) * 5/9
    }
    
    func fahrToKelvin(temp: Double) -> Double {
        let c = fahrToCelcius(temp: temp)
        
        return c + 273.15
    }
    
    var convertedTemp: Double {
        let temperature = Double(currentTemp) ?? 0
        
        if choosenUnit == "Celsius" {
            return fahrToCelcius(temp: temperature)
        } else {
            return fahrToKelvin(temp: temperature)
        }
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section("Fahrenheit Temp:") {
                    TextField("Input", text: $currentTemp)
                        .keyboardType(.decimalPad)
                        .focused($tempIsFocused)
                }
                
                Section("Choose a Unit") {
                    Picker("Units", selection: $choosenUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Converted Temp:") {
                    Text("\(convertedTemp)")
                }
                
            }
            .navigationTitle("Temperature Converter")
            .toolbar {
                Button("Done") {
                    tempIsFocused = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

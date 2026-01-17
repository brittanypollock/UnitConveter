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
    
    //Formula 
    
    var body: some View {
        NavigationStack{
            Form {
                Section("Fahrenheit Temp:") {
                    TextField("Input", text: $currentTemp)
                        .keyboardType(.decimalPad)
                        .focused($tempIsFocused)
                }
                
                Section {
                    Picker("Units", selection: $choosenUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    // Some Code
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

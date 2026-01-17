//
//  ContentView.swift
//  UnitConverter
//
//  Created by Brittany Pollock on 1/17/26.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTemp = "0"
    @FocusState private var tempIsFocused: Bool
    
    var body: some View {
        NavigationStack{
            Form {
                Section("Fahrenheit Temp:") {
                    TextField("Input", text: $currentTemp)
                        .keyboardType(.decimalPad)
                        .focused($tempIsFocused)
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

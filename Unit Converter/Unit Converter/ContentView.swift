//
//  ContentView.swift
//  Unit Converter
//
//  Created by Ashna Shah on 10/1/24.
//

import SwiftUI

struct ContentView: View {
    @State var inputVal = 0.0
    @State var inputUnit = ""
    @State var convertTo = ""

    let units = ["mL", "Liters", "Cups", "Pints", "Gallons"]
  
    let literToMilliliter = 1000.0
    let cupToMilliliter = 236.588
    let pintToMilliliter = 473.176
    let gallonToMilliliter = 3785.41

    var inputUnitToML: Double {
        switch inputUnit {
        case "mL":
            return inputVal
        case "Liters":
            return inputVal * literToMilliliter
        case "Cups":
            return inputVal * cupToMilliliter
        case "Pints":
            return inputVal * pintToMilliliter
        default:
            return inputVal * gallonToMilliliter
        }
    }

    var outputVal: Double {
        switch convertTo {
        case "mL":
            return inputUnitToML
        case "Liters":
            return inputUnitToML / literToMilliliter
        case "Cups":
            return inputUnitToML / cupToMilliliter
        case "Pints":
            return inputUnitToML / pintToMilliliter
        default:
            return inputUnitToML / gallonToMilliliter
        }
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Input Value and Unit") {
                    TextField("Input Value", value: $inputVal, format: .number)
                    Picker("Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Convert To") {
                    Picker("Unit", selection: $convertTo) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Output") {
                    Text("\(outputVal, specifier: "%.2f")")
                }
            }
            .navigationTitle("Volume Converter")
        }
    }
}

#Preview {
    ContentView()
}

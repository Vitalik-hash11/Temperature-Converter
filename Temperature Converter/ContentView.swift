//
//  ContentView.swift
//  Temperature Converter
//
//  Created by newbie on 25.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userTempratureInput = "Fahrenheit"
    @State private var userTempratureOutput = "Celsius"
    @State private var inputTempretureDegree: Double = 25
    
    private var outputTempretureDegree: Double {
        switch userTempratureInput {
        case "Fahrenheit":
            switch userTempratureOutput {
            case "Celsius":
                return (inputTempretureDegree - 32) / 1.8
            case "Rankine":
                return inputTempretureDegree + 459.67
            case "Kelvin":
                return (inputTempretureDegree + 459.67) * 5/9
            case "Fahrenheit":
                return inputTempretureDegree
            default:
                fatalError()
            }
        case "Celsius":
            switch userTempratureOutput {
            case "Celsius":
                return inputTempretureDegree
            case "Rankine":
                return (inputTempretureDegree + 273.15) * 9/5
            case "Kelvin":
                return inputTempretureDegree + 273.15
            case "Fahrenheit":
                return inputTempretureDegree * 1.8 + 32
            default:
                fatalError()
            }
        case "Rankine":
            switch userTempratureOutput {
            case "Celsius":
                return (inputTempretureDegree - 491.67) * 5/9
            case "Rankine":
                return inputTempretureDegree
            case "Kelvin":
                return  inputTempretureDegree * 5/9
            case "Fahrenheit":
                return inputTempretureDegree - 459.67
            default:
                fatalError()
            }
        case "Kelvin":
            switch userTempratureOutput {
            case "Celsius":
                return inputTempretureDegree - 273.15
            case "Rankine":
                return  inputTempretureDegree * 9/5
            case "Kelvin":
                return inputTempretureDegree
            case "Fahrenheit":
                return inputTempretureDegree * 9/5 - 459.67
            default:
                fatalError()
            }
        default: fatalError()
        }
    }
    
    private let tempretures = ["Fahrenheit", "Rankine", "Celsius", "Kelvin"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Tempreture Input", selection: $userTempratureInput) {
                        ForEach(tempretures, id: \.self) { tempretureType in
                            Text(tempretureType)
                        }
                    }.pickerStyle(.segmented)
                    TextField("Temreture degree", value: $inputTempretureDegree, format: .number)
                } header: {
                    Text("Input tempreture")
                }
                
                Section {
                    Picker("Tempreture Output", selection: $userTempratureOutput) {
                        ForEach(tempretures, id: \.self) { tempretureType in
                            Text(tempretureType)
                        }
                    }.pickerStyle(.segmented)
                    Text(outputTempretureDegree, format: .number)
                } header: {
                    Text("Output tempreture")
                }
            }
            .navigationTitle("Temperature Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

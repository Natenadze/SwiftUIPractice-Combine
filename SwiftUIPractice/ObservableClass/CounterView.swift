//
//  CounterView.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 21.09.23.
//

import SwiftUI


struct CounterView: View {
    
    @Bindable var counterData: CounterData
    
    // MARK: -
    var body: some View {
        VStack {
            HStack {
                Button("-") {
                    counterData.minusNumber()
                }
                
                Text("\(counterData.number)")
                
                Button("+") {
                    counterData.plusNumber()
                }
            }
            
            Button("Is this prime?") {
                print("Is this prime? printed")
            }
             
            Button("What's the \(counterData.number)th prime?") {
                print("What's the \(counterData.number)th prime? printed")
            }
        }
        .font(.title)
        .navigationTitle("Counter demo")
    }
}

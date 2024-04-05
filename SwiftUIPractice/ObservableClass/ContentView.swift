//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 21.09.23.
//

import SwiftUI

@Observable 
class CounterData {
     var number = 0
    
    func plusNumber() {
        number += 1
    }
    
    func minusNumber() {
        number -= 1
    }
}


struct ContentView: View {
    
    @Bindable var counterData = CounterData()
    
    // MARK: -
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Counter demo") {
                    CounterView(counterData: counterData)
                }
                
                NavigationLink("Favorite primes") {
                    EmptyView()
                }
            }
            .navigationTitle("State management")
        }
    }
}



#Preview {
    ContentView()
}


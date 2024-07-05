//
//  Practicee.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 23.05.24.
//

import SwiftUI



struct RandomNumberView: View {
    @State var randomNumber = 0

    var body: some View {
        VStack {
            Text("Random number is: \(randomNumber)")
            Button("Randomize number") {
                randomNumber = (0..<1000).randomElement()!
            }
        }.padding(.bottom)
        
        CounterView2()
    }
}

//@Observable final class CounterViewModel {
    final class CounterViewModel: ObservableObject {
    @Published var count = 0
//    var count = 0

    func incrementCounter() {
        count += 1
    }
}

struct CounterView2: View {
    @StateObject var viewModel = CounterViewModel()

    var body: some View {
        VStack {
            Text("Count is: \(viewModel.count)")
            Button("Increment Counter") {
                viewModel.incrementCounter()
            }
        }
    }
}




#Preview {
    RandomNumberView()
}






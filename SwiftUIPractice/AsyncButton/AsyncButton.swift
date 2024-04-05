//
//  AsyncButton.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 05.04.24.
//

import SwiftUI



struct AsyncButtonView: View {
    @State private var counter = 0
    @State private var trigger = false
    
    var body: some View {
        VStack {
            Text("\(counter)")
            
            
            AsyncButton(cancellation: trigger) {
                do {
                    try await Task.sleep(for: .seconds(3))
                    counter += 1
                } catch {
                    
                }
            } label: {
                Text("Increment")
                Image(systemName: "plus")
            }
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            
            Button {
                trigger.toggle()
            } label: {
                Text("Cancel")
            }
        }
    }
    

}

// MARK: - Button


struct AsyncButton<Label: View, Trigger: Equatable>: View {
    var cancellation: Trigger
    let action: () async -> Void
    @ViewBuilder let label: Label
    
    @State private var task: Task<Void, Never>?
    @State private var isRunning = false
    
    
    var body: some View {
        Button {
            isRunning = true
            task = Task {
                await action()
                isRunning = false
            }
        } label: {
            label
        }
        .disabled(isRunning)
        .onChange(of: cancellation) {
            task?.cancel()
        }
    }
}


#Preview(body: {
  AsyncButtonView()
})

//
//  Combine.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 21.09.23.
//

import SwiftUI
import Combine


// MARK: - Publishers and Subscribers in Combine
/*
 https://www.youtube.com/watch?v=Q-1EDHXUunI&list=PLwvDm4VfkdpiagxAXCT33Rkwnc5IVhTar&index=26&ab_channel=SwiftfulThinking
 */

// MARK: - ViewModel
//@Observable
class SubscriberVM: ObservableObject {
    
    // MARK: - Properties
    
    @Published var count = 0
    @Published var textFieldText = ""
    @Published var textIsValid = false
    //    var timer: AnyCancellable? // We need to store Timer so that we can cancel it later
    var cancellables = Set<AnyCancellable>()
    
    
    // MARK: - Init
    
    init() {
        setUpTimer()
        addTextFieldSubscriber()
    }
    
    // MARK: - Methods
    
    func addTextFieldSubscriber() {
        $textFieldText
        // waits to end typing and runs .map after 0.5 sec
            .debounce(for: .seconds(0.2), scheduler: DispatchQueue.main)
            .map({ text -> Bool in
                if text.count > 3 {
                    return true
                }
                return false
            })
//            .assign(to: \.textIsValid, on: self)
            .sink(receiveValue: { [weak self] isValid in
                self?.textIsValid = isValid
            })
            .store(in: &cancellables)
    }
    
    func setUpTimer() {
        //        timer = Timer
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
        // Listen to the publisher and do smth when it changes
            .sink { [weak self] _ in
                guard let self else { return }
                count += 1
                
                //                if count >= 10 { timer?.cancel() }
                if count >= 10 {
                    for item in cancellables { item.cancel() }
                }
            }
            .store(in: &cancellables)
    }
    
}

// MARK: - View

struct Subscriber: View {
    
    @StateObject var vm = SubscriberVM()
    
    var body: some View {
        VStack {
//            Text("\(vm.textFieldText)")
//                .font(.largeTitle)
            
            Text("\(vm.textIsValid.description)")
                .font(.largeTitle)
            
            TextField("Type smth here..", text: $vm.textFieldText)
                .padding(.leading)
                .textFieldStyle(.plain)
                .frame(height: 45)
                .background(Color(UIColor.systemGray4))
                .padding()
                .autocorrectionDisabled()
        }
    }
    
}



// MARK: - Preview
#Preview {
    Subscriber()
}

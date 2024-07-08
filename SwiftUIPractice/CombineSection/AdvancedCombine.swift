//
//  AdvancedCombine.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 05.07.24.
//

import SwiftUI
import Combine

class AdvancedCombineDataService {
     
//    @Published var basicPublisher: String = "asd"
    
//    let currentValuePublisher = CurrentValueSubject<String, Never>("ffff")
    let passThroughPublisher = PassthroughSubject<Int, Never>()
    let boolPublisher = PassthroughSubject<Bool, Never>()
    let intPublisher = PassthroughSubject<Int, Never>()
    
    init() {
        publishFakeData()
    }
    
    private func publishFakeData() {
//        let items = ["One", "Two", "Three"]
        let intItems = Array(1..<11)
        for i in intItems.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
//                self.basicPublisher = items[i]
//                self.currentValuePublisher.send(items[i])
                self.passThroughPublisher.send(intItems[i])
                
                if i == intItems.indices.last {
                    self.passThroughPublisher.send(completion: .finished)
                }
                
                if i > 4 && i < 8 {
                    self.boolPublisher.send(true)
                } else {
                    self.boolPublisher.send(false)
                }
                
                if i > 5{
                    self.intPublisher.send(911)
                }
            }
        }

    }
}

final class AdvancedCombineViewModel: ObservableObject {
    
    @Published var data: [String] = []
//    @Published var intData: [Int] = []
    @Published var error: String = ""
    
    let dataService = AdvancedCombineDataService()
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
//        dataService.$basicPublisher
//        dataService.currentValuePublisher
//        dataService.passThroughPublisher
        
        // Sequence Operations
        /*
         // first
         /*
          //            .first()
          //            .first(where: { $0 > 3 })
          //            .tryFirst(where: { num in
          //                if num == 3 {
          //                    throw URLError(.badServerResponse)
          //                }
          //
          //                return num > 4
          //            })
          */
         // .last
         /*
          //            .last() // only shows up when publishing is finished.
          //            .last(where: { $0 > 4 })
          //            .tryLast(where: { num in
          //                if num == 3 {
          //                    throw URLError(.badServerResponse)
          //                }
          //
          //                return num > 4
          //            })
          */

 //            .dropFirst()
 //            .drop(while: { $0 < 3 })
 //            .prefix(4) // first 4
 //            .output(at: 2)
 //            .output(in: 2..<5)
         
         
         */

        // Math Operations
        /*
         //            .max()
         //            .max(by: { num1, num2 in
         //                num1 < num2
         //            })
                     .min()
         
         */
        
        // Filter / Reducing Operations
        /*
         //            .tryMap({ num in
         //                if num == 5 {
         //                    throw URLError(.badServerResponse)
         //                }
         //                return String(num)
         //            })
         //            .replaceError(with: "Some default value")
                 
         //            .compactMap({ $0 == 5 ? nil : String($0) })
         //            .filter({ $0 > 3 && $0 < 7 })
         //            .removeDuplicates()
         //            .replaceNil(with: 11)
         //            .scan(0, { currentValue, newValue in
         //                currentValue + newValue
         //            })
         //            .scan(0, { $0 + $1 })
         //            .scan(0, +)
         //            .collect() // publish everything together
         //            .allSatisfy({ $0 == 5 }) // returns TRUE, if every item is 5
         
         */

        // Timing operations
        /*
         //            .debounce(for: 1, scheduler: DispatchQueue.main)
         //            .delay(for: 2, scheduler: DispatchQueue.main)
         //            .measureInterval(using: DispatchQueue.main) // measure time between publishes
         //            .map({ str in
         //                "\(str.magnitude)"
         //            })
         //            .throttle(for: 5, scheduler: DispatchQueue.main, latest: true) // publish latest data in 5 seconds
         //            .retry(3) // if error comes from api, retries 3 times
         //            .timeout(0.7, scheduler: DispatchQueue.main) // if publish time exceeds 0.7 second, it will terminate publisher
         
         */
        
        // Multiple Publishers / Subscribers
        /*
         //            .combineLatest(dataService.boolPublisher)
         //            .compactMap({ num, bool in
         //                bool ? String(num) : nil
         //            })
         //            .removeDuplicates()
         //            .merge(with: dataService.intPublisher)
         //            .zip(dataService.boolPublisher) // makes 1 tuple publish
         //            .map({ tupple in
         //                String(tupple.0) + " " + tupple.1.description
         //            })
         //            .catch(error)
         //            .tryCatch()
         
         */

        
        dataService.passThroughPublisher
            .map({ String($0) })
            .sink { completion in
                switch completion {
                case .finished: 
                    print("finished")
                case .failure(let error): 
                    self.error = error.localizedDescription
                }
            } receiveValue: { [weak self] receivedData in
                self?.data.append(receivedData)
            }
            .store(in: &cancellables)

    }
}

struct AdvancedCombine: View {
    
    @StateObject private var viewModel = AdvancedCombineViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.data, id: \.self) { item in
                Text(item)
                    .font(.title)
            }
            
            if !viewModel.error.isEmpty {
                Text(viewModel.error)
            }
        }
    
    }
}

#Preview {
    AdvancedCombine()
}

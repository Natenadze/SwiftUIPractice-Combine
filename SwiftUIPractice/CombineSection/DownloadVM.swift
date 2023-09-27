//
//  DownloadVM.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 22.09.23.
//

import Foundation
import Combine


class DownloadWithCombineVM: ObservableObject {
    
    @Published var posts: [PostModel] = []
    var cancelables = Set<AnyCancellable>()
    
    
    // MARK: - Init
    init() {
        getPosts()
    }
    
    // MARK: - Methods
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        // 1. Create the publisher
        URLSession.shared.dataTaskPublisher(for: url)
        //            .subscribe(on: DispatchQueue.global(qos: .background))
        // 2. Subscribe publisher on background thread // not needed
            .receive(on: DispatchQueue.main) // 3. receive on main thread
            .tryMap(handleOutput)
            .decode(type: [PostModel].self, decoder: JSONDecoder()) // 5. Decode
            .replaceError(with: []) // if error replace it with any data or nothin and we can get rid of switch bellow
            .sink { completion in  // 6. sink - put item into the app
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print("There was an error \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] returnedPosts in
                self?.posts = returnedPosts
            }
            .store(in: &cancelables)
    }
    
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300
        else {
            throw URLError(.badServerResponse)
        }
        
        return output.data
    }
    
}

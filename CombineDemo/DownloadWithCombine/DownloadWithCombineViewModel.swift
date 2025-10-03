//
//  DownloadWithCombineViewModel.swift
//  CombineDemo
//
//  Created by Paresh  Karnawat on 02/10/25.
//

import Foundation
import SwiftUI
import Combine

class DownloadWithCombineViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPost()
    }
    
    func getPost() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        // 1. Create the publisher
        // 2. Subscrbe publisher on background thread
        // 3. received on main thread
        // 4. trymap (check that the data is good)
        // 5. Decode (decode data into PostModels)
        // 6. Sink (put the item into our app)
        // 7. store (cancel subscription if needed)
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background)) // This step is not required as it is default on background thread
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print("Error - \(error)")
                }
            } receiveValue: { [weak self] (returnedPosts) in
                self?.posts = returnedPosts
            }
            .store(in: &cancellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}


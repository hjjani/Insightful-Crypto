//
//  NetworkingManager.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 2/22/25.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkinError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url): return "[🔥] Bad response from URL: \(url)"
            case .unknown: return "[⚠️] Unknown error occurred."
            }
        }
    }
    
    static func download(url: URL) ->  AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            // the data task publisher above will already be on a background thread - the line below is optional!
            //.subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponse(output: $0, url: url) })
            .retry(3)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkinError.badURLResponse(url:url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}

//
//  NetworkingManager.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 2/22/25.
//
// NetworkingManager is responsible for handling all network requests.
// It provides methods for downloading data and handling URL responses, as well as error handling.

import Foundation
import Combine

class NetworkingManager {

    // Enum to define potential network errors.
    enum NetworkinError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown

        // Provides a localized error description for each error case.
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url): return "[🔥] Bad response from URL: \(url)"
            case .unknown: return "[⚠️] Unknown error occurred."
            }
        }
    }

    // Function to perform a network download and return a publisher with the response data.
    // - parameter url: The URL to download data from.
    // - returns: A publisher that emits the data on success or an error on failure.
    static func download(url: URL) ->  AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            // the data task publisher above will already be on a background thread - the line below is optional!
            //.subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponse(output: $0, url: url) })
            .retry(3)
            .eraseToAnyPublisher()
    }

    // Function to handle the URL response and check if the HTTP status code is valid (200-299)
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkinError.badURLResponse(url:url)
        }
        return output.data
    }

    // Function to handle the completion of the network request.
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}

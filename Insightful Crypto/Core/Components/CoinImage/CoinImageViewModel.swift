//
//  CoinImageViewModel.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 2/23/25.
//
//  ViewModel that handles image downloading using Combine.
//  Subscribes to CoinImageService and updates UI via @Published properties.

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil // Image published to update UI
    @Published var isLoading: Bool = false // Tracks loading state
    
    private let coin: CoinModel
    private let dataService: CoinImageService // Service that fetches the image
    private var cancellables = Set<AnyCancellable>() // Combine subscriptions container
    
    init (coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.addSubscribers()
        self.isLoading = true
    }

    // Bind the image from the data service and update loading state
    private func addSubscribers() {
        
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)

        
    }
    
}

//
//  CoinImageService.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 2/23/25.
//
// CoinImageService is responsible for fetching and caching the coin images.
// It uses Combine to handle asynchronous fetching and updates the image when it's available.

import Foundation
import SwiftUI
import Combine

class CoinImageService {

    @Published var image: UIImage? = nil                 // Published property to hold the image of the coin.
    private var imageSubscription: AnyCancellable?       // Cancellable to store the subscription for the image download.
    private let coin: CoinModel                          // Reference to the CoinModel to get the image URL.
    private let fileManager = LocalFileManager.instance  // FileManager to manage saving and retrieving images locally.
    private let folderName = "coin_images"               // Folder name where images will be stored locally.
    private let imageName: String                        // Image name derived from the coin's unique id.
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()

    }

    // Function to fetch the coin image
    private func getCoinImage() {
        // First, check if the image is already saved locally.
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            // If saved image is found, assign it to the image property
            image = savedImage
            print("Retrieved image from file manager!")
        } else {
            // If not found, download the image from the URL.
            downloadCoinImage()
            print("Downloading image now")
        }
    }

    // Function to download the coin image
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image)
        else { return }

        // Use NetworkingManager to download the image data
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                // Convert the data into an image
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main) // Ensure UI updates happen on the main thread
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedimage = returnedImage else { return }
                // Assign the downloaded image to the published property
                self.image = downloadedimage
                // Cancel the subscription as we no longer need it
                self.imageSubscription?.cancel()
                // Save the image locally for future use
                self.fileManager.saveImage(image: downloadedimage, imageName: self.imageName, folderName: self.folderName)
            })
    }
    
}

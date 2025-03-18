//
//  LocalFileManager.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 2/23/25.
//
// LocalFileManager is responsible for handling the local storage of images on the device.
// It provides functionality for saving and retrieving images to/from the app's local file system.

import Foundation
import SwiftUI

class LocalFileManager {

    // Singleton instance of LocalFileManager
    static let instance = LocalFileManager()
    
    private init() { }

    // Function to save an image to a specified folder
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        // create folder
        createFolderIfNeeded(folderName: folderName)
        
        // get path for image
        guard
            let data = image.pngData(),
            let url = getURLForImage(imageName: imageName, folderName: folderName)
        else { return }
        
        // save image to path
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image. ImageName: \(imageName). \(error)")
        }
    }

    // Function to retrieve an image from the local file system
    func getImage(imageName: String, folderName: String) -> UIImage? {
        
        guard
            let url = getURLForImage(imageName: imageName, folderName: folderName),
            FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        return UIImage(contentsOfFile: url.path)
    }

    // Private function to create a folder if it doesn't already exist
    private func createFolderIfNeeded(folderName: String) {
        
        guard let url = getURLForFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("Error creating directory. FolderName: \(folderName). \(error)")
            }
        }
    }

    // Private function to get the URL for the folder in the file system
    private func getURLForFolder(folderName: String) -> URL? {
        
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(folderName)
    }

    // Private function to get the URL for the image file in the specified folder
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        
        guard let folderURL = getURLForFolder(folderName: folderName) else {
            return nil
        }
        return folderURL.appendingPathComponent(imageName + ".png")
    }
    
}

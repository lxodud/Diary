//
//  CacheManager.swift
//  Diary
//
//  Copyright (c) 2023 Minii All rights reserved.

import Foundation

final class ImageData {
    let imageData: Data
    
    init(imageData: Data) {
        self.imageData = imageData
    }
}

final class CacheManager {
    static let shared = CacheManager()
    
    private let memoryCache = NSCache<NSString, ImageData>()
    private let diskCache = FileManager.default
    
    private var folderURL: URL?
    
    private init() {
        createFolder()
    }
    
    func saveMemory(key: String?, data: Data) {
        guard let key = key else { return }
        let objectKey = NSString(string: key)
        
        memoryCache.setObject(ImageData(imageData: data), forKey: objectKey)
    }
    
    func readMemory(key: String?) -> ImageData? {
        guard let key = key else { return nil }
        let objectKey = NSString(string: key)
        
        return memoryCache.object(forKey: NSString(string: objectKey))
    }
    
    private func createFolder() {
        let urls = diskCache.urls(for: .cachesDirectory, in: .userDomainMask)
        
        guard var url = urls.first,
              folderURL == nil else {
            return
            
        }
        
        url.appendPathComponent("Diary")
        try? diskCache.createDirectory(atPath: url.path, withIntermediateDirectories: true)
        folderURL = url
    }
    
    func saveDisk(key: String?, data: Data?) {
        guard let key = key,
              let folderURL = folderURL
        else {
            return
        }
        
        let fileURL = folderURL.appendingPathComponent(key)
        try? data?.write(to: fileURL)
    }
    
    func readDisk(key: String?) -> Data? {
        guard let key = key,
              let folderURL = folderURL else { return nil }
        
        let fileURL = folderURL.appendingPathComponent(key)
        guard let data = diskCache.contents(atPath: fileURL.path) else { return nil }
        
        return data
    }
}

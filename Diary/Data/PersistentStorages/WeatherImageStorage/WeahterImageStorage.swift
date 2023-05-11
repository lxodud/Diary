//
//  CacheImageStorage.swift
//  Diary
//
//  Created by 이태영 on 2023/05/11.
//

import Foundation

protocol WeatherImageStorage {
    func fetchWeatherImage(key: String?, data: Data)
    func save(key: String?) -> Data?
}

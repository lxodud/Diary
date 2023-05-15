//
//  CacheImageStorage.swift
//  Diary
//
//  Created by 이태영 on 2023/05/11.
//

import Foundation

protocol WeatherImageStorage {
    func fetchWeatherImage(key: String?, completion: @escaping (Result<Data, CacheError>) -> Void)
    func save(key: String?, data: Data)
}

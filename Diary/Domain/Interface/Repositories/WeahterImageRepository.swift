//
//  WeahterImageRepository.swift
//  Diary
//
//  Created by 이태영 on 2023/05/10.
//

import Foundation

protocol WeatherImageRepository {
    func fetchWeahterImage(completion: @escaping (Result<Data, NetworkError>) -> Void)
}

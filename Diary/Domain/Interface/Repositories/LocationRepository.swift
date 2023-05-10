//
//  LocationRepository.swift
//  Diary
//
//  Created by 이태영 on 2023/05/10.
//

import Foundation

protocol LocationRepository {
    func fetchCurrentLocation() -> Location
}

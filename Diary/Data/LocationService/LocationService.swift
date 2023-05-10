//
//  LocationService.swift
//  Diary
//
//  Created by 이태영 on 2023/05/10.
//

import Foundation
import CoreLocation

protocol LocationService {
    func fetchCurrentLocation() -> Location
}

final class CLLocationService {
    private let locationManager = CLLocationManager()
}

//extension CLLocationService: LocationService {
//    func fetchCurrentLocation() -> Location {
//        
//    }
//}

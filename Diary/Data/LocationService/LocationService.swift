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

final class CLLocationService: NSObject {
    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
}

extension CLLocationService: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
            
        case .restricted, .notDetermined:
            manager.requestWhenInUseAuthorization()
            
        case .denied:
            manager.stopUpdatingLocation()
            
        @unknown default:
            return
        }
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        guard let location = locations.first?.coordinate else {
            return
        }
        
        currentLocation = location
    }
}

extension CLLocationService: LocationService {
    func fetchCurrentLocation() -> Location {
        locationManager.requestLocation()
        return currentLocation.toDomain()
    }
}

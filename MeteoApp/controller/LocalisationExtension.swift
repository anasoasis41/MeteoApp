//
//  LocalisationExtension.swift
//  MeteoApp
//
//  Created by MAC-Anas on 27/07/2018.
//  Copyright © 2018 MAC-Anas. All rights reserved.
//

import UIKit
import MapKit

extension MeteoController: CLLocationManagerDelegate {
    
    func miseEnplaceCLLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard locations.count > 0 else { return }
        locationManager?.stopUpdatingLocation()
        
        let positionActuelle = locations[0]
        let latitude = positionActuelle.coordinate.latitude
        let longitude = positionActuelle.coordinate.longitude
        
        if !enTrainDeRecupererLesDonnees {
            previsionJournalieres = [PrevisionJournaliere]()
            previsions = [Prevision]()
            obtenirPrevisionsMeteo(latitude: latitude, longitude: longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}








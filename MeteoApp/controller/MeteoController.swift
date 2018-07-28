//
//  MeteoController.swift
//  MeteoApp
//
//  Created by MAC-Anas on 27/07/2018.
//  Copyright © 2018 MAC-Anas. All rights reserved.
//

import UIKit
import MapKit

class MeteoController: UIViewController {

    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miseEnplaceCLLocation()

    }


}

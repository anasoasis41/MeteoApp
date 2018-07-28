//
//  MeteoController.swift
//  MeteoApp
//
//  Created by MAC-Anas on 27/07/2018.
//  Copyright © 2018 MAC-Anas. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class MeteoController: UIViewController {

    var locationManager: CLLocationManager?
    var prevision = [Prevision]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miseEnplaceCLLocation()

    }
    
    func obtenirPrevisionsMeteo(latitude: Double, longitude: Double) {
        let urlDeBase = "http://api.openweathermap.org/data/2.5/forecast?"
        let latitude = "lat=" + String(latitude)
        let longitude = "&lon=" + String(longitude)
        let uniteEtLangue = "&units=metric&lang=fr"
        let cleApi = "&APPID=" + API
        let urlString = urlDeBase + latitude + longitude + uniteEtLangue + cleApi
        
        guard let url = URL(string: urlString) else { return }
        
        Alamofire.request(url).responseJSON { (response) in
            if let reponse = response.value as? [String: AnyObject] {
                print(response)
            }
        }
        
    }


}






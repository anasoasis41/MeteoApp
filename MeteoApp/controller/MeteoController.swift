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

    @IBOutlet weak var villeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var iconeTempsActuel: UIImageView!
    @IBOutlet weak var descTempActuel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let previsionCell = "PrevisionCell"
    
    var locationManager: CLLocationManager?
    var previsions = [Prevision]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miseEnplaceCLLocation()
        miseEnPlaceTableView()

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
                if let infoVille = reponse["city"] as? [String: AnyObject] {
                    if let maVille = infoVille["name"] as? String {
                        self.villeLabel.text = maVille
                        if let liste = reponse["list"] as? NSArray {
                            for element in liste {
                                if let dict = element as? [String: AnyObject] {
                                    if let main = dict["main"] as? [String: AnyObject] {
                                        if let temp = main["temp"] as? Double {
                                            if let weather = dict["weather"] as? NSArray, weather.count > 0 {
                                                if let tempsActuel = weather[0] as? [String: AnyObject] {
                                                    if let desc = tempsActuel["description"] as? String {
                                                        if let icone = tempsActuel["icon"] as? String {
                                                            if let date = dict["dt_txt"] as? String {
                                                                let nouvellePrevision = Prevision(temperature: temp, date: date, icone: icone, desc: desc)
                                                                self.previsions.append(nouvellePrevision)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            // Recharger les données
                            self.miseEnPlaceValeursDuMoment()
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
        
    }
    
    func miseEnPlaceValeursDuMoment() {
        if previsions.count > 0 {
            let tempsActuel = previsions[0]
            temperatureLabel.text = tempsActuel.temperature.convertirEnIntString()
            descTempActuel.text = tempsActuel.desc
            ImageDownloader.obtenir.imageDepuis(tempsActuel.icone, imageView: iconeTempsActuel)
        }
    }


}






//
//  Extension.swift
//  MeteoApp
//
//  Created by MAC-Anas on 31/07/2018.
//  Copyright © 2018 MAC-Anas. All rights reserved.
//

import Foundation

extension Double {
    
    func convertirEnIntString() -> String {
        let int = Int(self)
        return String(int) + "°C"
    }
}

//
//  PrevisionCell.swift
//  MeteoApp
//
//  Created by MAC-Anas on 23/08/2018.
//  Copyright © 2018 MAC-Anas. All rights reserved.
//

import UIKit

class PrevisionCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var previsions = [Prevision]()
    let cellID = "DonneeUniqueCell"
    
    func miseEnPlace(previsions: [Prevision]) {
        self.previsions = previsions
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return previsions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let prevision = previsions[indexPath.item]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? DonneeUniqueCell {
            cell.miseEnPlace(prevision: prevision)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }

}













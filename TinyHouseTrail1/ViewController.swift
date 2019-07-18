//
//  ViewController.swift
//  TinyHouseTrail1
//
//  Created by Mohith Mullaguru Prabhakar on 7/16/19.
//  Copyright © 2019 Mohith Mullaguru Prabhakar. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

struct Item {
    var imageName : String
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    
    let locationName = ["WoodenView", "InteriorView", "ExteriorView"]
    
    let locationImage = [UIImage(named: "WoodenView"),UIImage(named: "InteriorView"),UIImage(named: "ExteriorView")]
    
    let ARViewIdentifier = "ARViewIdentifier"
    
    
    let ARArray = ["Models.scnassets/chair/chair.scn","Models.scnassets/cup/cup.scn","Models.scnassets/lamp/lamp.scn"]
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ARViewIdentifier" {
            let destAR = segue.destination as! ARView
            //destAR. = sender as? item
        }
    } 
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.LocationName.text = locationName[indexPath.row]
        cell.locationImage.image = locationImage[indexPath.row]
        
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = ARArray[indexPath.item]
        performSegue(withIdentifier: ARViewIdentifier, sender: item)
   
    }
}

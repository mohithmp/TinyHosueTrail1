//
//  ARView.swift
//  TinyHouseTrail1
//
//  Created by Mohith Mullaguru Prabhakar on 7/16/19.
//  Copyright © 2019 Mohith Mullaguru Prabhakar. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import Foundation

class ARView: UIViewController {

   
    @IBOutlet weak var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    
    //var scen: Item?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    

}

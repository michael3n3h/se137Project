//
//  ViewController.swift
//  Cmpe137finalProject
//
//  Created by Computer on 4/25/17.
//  Copyright © 2017 Computer. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    var menuShowing = false
    let regionRadius: CLLocationDistance = 800
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation  = CLLocation(latitude:37.335187, longitude: -121.881072)
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 6
        centerMapOnLocation(location: initialLocation)
    }
    @IBAction func openMenu(_ sender: Any) {
        if(menuShowing){
            leadingConstraint.constant = -150
        }else{
            leadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        
        menuShowing = !menuShowing
    }
    func centerMapOnLocation(location: CLLocation) {
      
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}


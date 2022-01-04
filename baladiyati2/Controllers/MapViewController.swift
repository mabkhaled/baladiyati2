//
//  MapViewController.swift
//  baladiyati2
//
//  Created by Mac-Mini-2021 on 16/11/2021.
//

import UIKit
import GoogleMaps

class MapController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey("AIzaSyAcYMVqKEiD08oBkXq-EBvmxR4YZFxdd0w")
           // Do any additional setup after loading the view.
                    // Create a GMSCameraPosition that tells the map to display the
                    // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 36.866537, longitude: 10.164723, zoom: 10.0)
                    let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
                    self.view.addSubview(mapView)

                    // Creates a marker in the center of the map.
                    let marker = GMSMarker()
                    marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
                    marker.title = "Sydney"
                    marker.snippet = "Australia"
                    marker.map = mapView
        
        //
         let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: 36.869843, longitude: 10.177417)
                           marker1.title = "Hopital Abdelrahmen Mami"
                           marker1.snippet = "Tunisia"
                           marker1.map = mapView
        
        
          //
               let marker2 = GMSMarker()
              marker2.position = CLLocationCoordinate2D(latitude: 36.879731, longitude: 10.179683)
                                 marker2.title = "Centre médical el ghazela"
                                 marker2.snippet = "Tunisia"
                                 marker2.map = mapView
        
         //
                      let marker3 = GMSMarker()
                     marker3.position = CLLocationCoordinate2D(latitude: 36.867912, longitude: 10.182898)
                                        marker3.title = "Hopital Mahmoud El Matri"
                                        marker3.snippet = "Tunisia"
                                        marker3.map = mapView
        
         //
                             let marker4 = GMSMarker()
                            marker4.position = CLLocationCoordinate2D(latitude: 36.867912, longitude: 10.182898)
                            marker4.title = "Hopital Mahmoud El Matri"
                            marker4.snippet = "Tunisia"
                           marker4.map = mapView
        
    }

    
       

}


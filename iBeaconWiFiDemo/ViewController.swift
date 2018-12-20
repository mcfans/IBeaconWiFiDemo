//
//  ViewController.swift
//  iBeaconWiFiDemo
//
//  Created by 杨学思 on 2018/12/20.
//  Copyright © 2018 杨学思. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let beaconRegion = CLBeaconRegion(proximityUUID: UUID(), identifier: "hhhh")
    
    var task: URLSessionDataTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startRangingBeacons(in: beaconRegion)
        // Do any additional setup after loading the view, typically from a nib.
        
        let request = URLRequest(url: URL(string: "https://www.baidu.com")!)
        task = URLSession.shared.dataTask(with: request) { (data, res, error) in
            print(data, res, error)
        }
    }
    
    var firstTime: Bool = true
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if firstTime {
            task?.resume()
            firstTime.toggle()
        }
        print("ranging beacon")
    }


}


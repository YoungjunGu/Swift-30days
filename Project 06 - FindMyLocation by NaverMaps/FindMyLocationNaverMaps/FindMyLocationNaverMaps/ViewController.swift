//
//  ViewController.swift
//  FindMyLocationNaverMaps
//
//  Created by youngjun goo on 08/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @IBAction func myLocationButtonDidTouch(_ sender: UIButton) {
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // app이 실행 되어있을 때 location 서비스를 요청할 권한을 설정
        locationManager.requestAlwaysAuthorization()
        // 사용자의 현재 위치를 repoert 하는 업데이트 생성 시작
        locationManager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


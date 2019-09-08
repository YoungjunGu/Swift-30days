//
//  CLLocationDelegate.swift
//  FindMyLocationNaverMaps
//
//  Created by youngjun goo on 08/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation
import CoreLocation


extension ViewController: CLLocationManagerDelegate {
    
    // Location request시 에러 발생시 호출 되는 함수
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        self.locationLabel.text = "현재 사용자의 위치를 가져올 수 없습니다." + error.localizedDescription
    
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // CLGeocoder : 사용자의 위치 정보를 가져오는 싱글 객체
        CLGeocoder().reverseGeocodeLocation(locations.first!) { (placemarks, error) in
            guard error == nil else {
                self.locationLabel.text = "Reverse geocoder 실패" + error!.localizedDescription
                return
            }
            if placemarks!.count > 0 {
                let firstPlaceMmark = placemarks?.first
                self.displayLocationInfo(firstPlaceMmark)
            } else {
                self.locationLabel.text = "geocoder에서 데이터를 받아오는데 실패"
            }
        }
    }
    
    // CLPlacemark : 장소 이름, 주소 및 기타 관련 정보를 포함하는 지리 좌표에 대한 사용자 친화적인 설명.
    func displayLocationInfo(_ placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            // location 업데이트 시점을 알고 업데이트를 멈춤으로서 앱 배터리 사용률을 줄인다.
            locationManager.stopUpdatingLocation()
            
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            self.locationLabel.text = postalCode! + " " + locality!
            
            self.locationLabel.text?.append("\n" + administrativeArea! + ", " + country!)
            
        }
    }
}

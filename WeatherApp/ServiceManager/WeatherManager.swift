//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Faran on 3/24/19.
//  Copyright © 2019 Faran. All rights reserved.
//

import UIKit
import Alamofire

class WeatherManager {

    func getWeatherData(endPoint:String,param:[String:Any],completion: @escaping (WeatherBase) -> Void){
        
        let headers: [String : String] = [:]
        
        let param = AFParam(endpoint: "", params: param, headers: headers, method: .get, parameterEncoding: URLEncoding.default, images: [])
        
        AFNetwork.shared.apiGeneric(param, modelType:WeatherBase.self ) { (res) in
            
            if res.cod == "200" {
                completion(res)
            }else{
                Alert.showAlertToast(msg: "Error Occur")
            }
            
        }
    }
}

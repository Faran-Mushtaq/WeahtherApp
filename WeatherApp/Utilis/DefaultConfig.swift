//
//  DefaultConfig.swift


import UIKit

public let DEFAULT_CONFIG = DefaultConfig.shared;

public class DefaultConfig: NSObject {
    
    static let shared = DefaultConfig()
    
    //Project settings
     public var baseUrl:String = "https://maps.googleapis.com/maps/api/place/nearbysearch/json";
    
    //PRIVATE init so that singleton class should not be reinitialized from anyother class
    fileprivate override init() {
        super.init()
    }
}

//
//  RestuarantListController.swift
//  Restuarant
//
//  Created by Faran on 3/23/19.
//  Copyright © 2019 Faran. All rights reserved.
// AFManagerProtocol.swift


import Foundation

public protocol AFManagerProtocol {
    func api(_ param: AFParam, completion: @escaping () -> Void)
}

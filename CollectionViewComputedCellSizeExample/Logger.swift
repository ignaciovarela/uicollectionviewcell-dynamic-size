//
//  Logger.swift
//  CollectionViewComputedCellSizeExample
//
//  Created by Ignacio Varela on 9/4/16.
//  Copyright © 2016 Ignacio Varela. All rights reserved.
//

import Foundation

struct Logger {
    
    private static let loggingEnabled = false
    
    static func log(message: String) {
        print("\(NSDate()): \(message)")
    }

}
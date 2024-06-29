//
//  Item.swift
//  ScanGrater
//
//  Created by Pablo on 29/6/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

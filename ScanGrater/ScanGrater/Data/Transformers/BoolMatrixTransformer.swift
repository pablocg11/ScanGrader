//
//  BoolMatrixTransformer.swift
//  ScanGrater
//
//  Created by Pablo on 29/6/24.
//

import Foundation

@objc(BoolMatrixTransformer)
class BoolMatrixTransformer: ValueTransformer {
    override class func allowsReverseTransformation() -> Bool {
        return true
    }
    
    override class func transformedValueClass() -> AnyClass {
        return NSData.self
    }
    
    override func transformedValue(_ value: Any?) -> Any? {
        guard let boolMatrix = value as? [[Bool]] else { return nil }
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: boolMatrix, requiringSecureCoding: false)
            return data
        } catch {
            return nil
        }
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        do {
            if let boolMatrix = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSArray.self, from: data) as? [[Bool]] {
                return boolMatrix
            }
            return nil
        } catch {
            return nil
        }
    }
}

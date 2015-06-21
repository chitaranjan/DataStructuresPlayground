import Foundation
import XCPlayground

public func visualize(identifier: String, array: [Int])
{
    for x in array {
        XCPCaptureValue(identifier, value: x)
    }
}

public func randomArray(count: Int, maxNumber: UInt32) -> [Int] {
    var array = [Int]()
    
    for _ in 1...count {
        array.append(Int(arc4random_uniform(maxNumber)))
    }
    
    return array
}
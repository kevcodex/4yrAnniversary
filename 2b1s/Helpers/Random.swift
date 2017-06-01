//
//  Random.swift
//  Qix
//
//  Created by Ray Fix on 5/18/17.
//  Copyright © 2017 Ray Fix. All rights reserved.
//

import Foundation

extension Int {
    public var randomUniform: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}

extension RandomAccessCollection {
    var random: Iterator.Element {
        precondition(!isEmpty)
        let count: Int = numericCast(self.count)
        let randomDistance: IndexDistance = numericCast(count.randomUniform)
        let index = self.index(startIndex, offsetBy: randomDistance)
        return self[index]
    }
}

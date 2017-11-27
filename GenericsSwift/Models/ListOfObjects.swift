//
//  ListOfObjects.swift
//  GenericsSwift
//
//  Created by Ildar Zalyalov on 27.11.2017.
//  Copyright © 2017 Ildar Zalyalov. All rights reserved.
//

import Foundation

struct ListOfObjects<T: HasCostProtocol> {
    
    var items:[T]
    
    mutating func add(item: T) {
        items.append(item)
    }
    
    mutating func remove() -> T {
        return items.removeLast()
    }
    
    func isCapacityLow() -> Bool {
        return items.count < 3
    }
}

extension ListOfObjects {

    var someCount: Int {
        get{ return items.count }
    }
}

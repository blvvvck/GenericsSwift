//
//  HasCostProtocol.swift
//  GenericsSwift
//
//  Created by Ildar Zalyalov on 27.11.2017.
//  Copyright © 2017 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol HasCostProtocol {
    var cost: Int {get set}

    typealias CurrencyCost = (Int)
}

protocol Euro {
    var currencyCost: Int { get }
}

struct Dollar {
    var cost: Int
}

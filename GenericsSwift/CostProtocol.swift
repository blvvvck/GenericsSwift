//
//  CostProtocol.swift
//  GenericsSwift
//
//  Created by Ildar Zalyalov on 27.11.2017.
//  Copyright © 2017 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol CostProtocol {
    
    func totalCost<T: HasCostProtocol, M: HasCostProtocol>(of firstPotato: T, second: M) -> Int
    func cost<T: HasCostProtocol>(of firstPotato: T) -> T
    
    func someCost<T: HasCostProtocol>(of firstPotato: T) -> T where T: Euro
}

class CostProtocolImplementation: CostProtocol {
    
    func someCost<T>(of firstPotato: T) -> T where T : Euro, T : HasCostProtocol {
        return firstPotato
    }
    
    func cost<T:HasCostProtocol>(of firstPotato: T) -> T where T.CurrencyCost == T.CurrencyCost {
        
        return firstPotato
    }
    
    func totalCost<T, M>(of firstPotato: T, second: M) -> Int where T : HasCostProtocol, M : HasCostProtocol {
        
        return firstPotato.cost + second.cost
    }
}

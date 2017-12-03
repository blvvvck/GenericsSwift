//
//  WorkWithDataProtocol.swift
//  VKDesign(11September)
//
//  Created by BLVCK on 29/10/2017.
//  Copyright © 2017 blvvvck production. All rights reserved.
//

import Foundation

protocol WorkWithDataProtocol {
 
    func syncSave<T: NSCoding>(with: T)
    func asyncSave<T: NSCoding>(with: T, completionBlock: @escaping (Bool) -> ())
    func syncGetAll<T: NSCoding>() -> [T]?
    func asyncGetAll<T: NSCoding>(completionBlock: @escaping ([T]) -> ())
    func syncFind<T: NSCoding>(id: String) -> T? where T: HasIdProtocol
    func asyncFind<T: NSCoding>(id: String, completionBlock: @escaping (T?) -> ()) where T: HasIdProtocol
}

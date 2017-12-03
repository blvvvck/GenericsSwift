//
//  DataManager.swift
//  VKDesign(11September)
//
//  Created by BLVCK on 27/11/2017.
//  Copyright © 2017 blvvvck production. All rights reserved.
//

import Foundation

class DataManager: WorkWithDataProtocol {
    
    func syncSave<T>(with entity: T) where T : NSCoding {
        
        let entityKeyPath = NSStringFromClass(T.self)
        
        if let currentEntityData = UserDefaults.standard.data(forKey: entityKeyPath) {
            guard var currentEntityArray = NSKeyedUnarchiver.unarchiveObject(with: currentEntityData) as? [T] else { return }
            currentEntityArray.append(entity)
            let archiver = NSKeyedArchiver.archivedData(withRootObject: currentEntityArray)
            UserDefaults.standard.set(archiver, forKey: entityKeyPath)
        } else {
            let archiver = NSKeyedArchiver.archivedData(withRootObject: [entity])
            UserDefaults.standard.set(archiver, forKey: entityKeyPath)
        }
    }
    
    func asyncSave<T>(with entity: T, completionBlock: @escaping (Bool) -> ()) where T : NSCoding {
        let operationQueue = OperationQueue()
        operationQueue.addOperation {
            self.syncSave(with: entity)
            completionBlock(true)
        }
    }
    
    func syncGetAll<T>() -> [T]? where T : NSCoding {
        let entityKeyPath = NSStringFromClass(T.self)
        if let currentEntityArray = UserDefaults.standard.data(forKey: entityKeyPath) {
            guard let currentEntityArray = NSKeyedUnarchiver.unarchiveObject(with: currentEntityArray) as? [T] else { return nil }
            return currentEntityArray
        } else { return nil }
       
    }
    
    func asyncGetAll<T>(completionBlock: @escaping ([T]) -> ()) where T : NSCoding {
        let operationQueue = OperationQueue()
        operationQueue.addOperation {
            guard let currentEntityArray: [T] = self.syncGetAll() else { return }
            completionBlock(currentEntityArray)
        }
    }
    
    func syncFind<T: NSCoding>(id: String) -> T? where T: HasIdProtocol {
        guard let currentEnities: [T] = syncGetAll() else { return nil }
        for entity in currentEnities {
            if entity.id == id {
                return entity
            }
        }
        return nil
    }
    
    func asyncFind<T: NSCoding>(id: String, completionBlock: @escaping (T?) -> ()) where T: HasIdProtocol {
        let operationQueue = OperationQueue()
        operationQueue.addOperation {
            guard let currentEntities: [T] = self.syncGetAll() else { return }
            for entity in currentEntities {
                if entity.id == id {
                    completionBlock(entity)
                }
            }
            completionBlock(nil)
        }
    }
}

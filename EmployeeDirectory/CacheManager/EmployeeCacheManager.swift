//
//  EmployeeCache.swift
//  EmployeeDirectory
//
//  Created by Uday Khatri on 2022-11-28.
//

import Foundation

class EmployeeCacheManager {
    static let instance = EmployeeCacheManager() // Singleton
    private init(){} // Now we can not initialize CacheManager again in code

    var employeeListCache: NSCache<NSString, NSArray> = {
      let cache = NSCache<NSString, NSArray>()
        cache.countLimit = 100 // seting limit to 100 so that it does not overload storage
        cache.totalCostLimit = 1024 * 1024 * 100 // setting limit to 100mb
        return cache
    }()
    
    func add(employees: [Employee], key: String){
        employeeListCache.setObject(employees as NSArray, forKey: key as NSString)
        print("Added to cache!")
    }
    
    func remove(key: String){
        employeeListCache.removeObject(forKey: key as NSString)
        print("Cache cleared!")
    }
    func get(key:String) -> [Employee]? {
        return employeeListCache.object(forKey: key as NSString) as? [Employee]
    }
    
}

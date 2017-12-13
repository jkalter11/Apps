//
//  DataService.swift
//  Apps
//
//  Created by Murari Varma on 13/12/17.
//  Copyright © 2017 Murari Varma. All rights reserved.
//

import Foundation

class DataService {
    
    static let instance = DataService()
    
    public let categories = [
        Category(title: "TOP FREE", imageName: "top-free.png"),
        Category(title: "TOP GROSSING", imageName: "top-grossing.png"),
        Category(title: "TOP PAID", imageName: "top-paid.png")
    ]
    
    func getCategories() -> [Category] {
        return categories
    }
    
}

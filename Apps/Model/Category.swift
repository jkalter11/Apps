//
//  Category.swift
//  Apps
//
//  Created by Murari Varma on 13/12/17.
//  Copyright © 2017 Murari Varma. All rights reserved.
//

import Foundation

struct Category {
    
    private(set) public var title: String
    private(set) public var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
    
}

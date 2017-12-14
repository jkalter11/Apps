//
//  App.swift
//  Apps
//
//  Created by Murari Varma on 13/12/17.
//  Copyright © 2017 Murari Varma. All rights reserved.
//

import Foundation

struct App {
    private(set) public var title: String
    private(set) public var imageURL: String
    private(set) public var artist: String
    
    init(title: String, imageURL: String, artist: String) {
        self.title = title
        self.imageURL = imageURL
        self.artist = artist
    }
}

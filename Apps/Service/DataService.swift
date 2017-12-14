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
    var dataDict = NSDictionary()
    var appsData = [NSDictionary]()
    var a = [App]()
    
    public let categories = [
        Category(title: "TOP FREE", imageName: "top-free.png"),
        Category(title: "TOP GROSSING", imageName: "top-grossing.png"),
        Category(title: "TOP PAID", imageName: "top-paid.png")
    ]
    
    func getCategories() -> [Category] {
        return categories
    }
    
    private let urls = [
        String("https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/100/explicit.json"),
        String("https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/100/explicit.json"),
        String("https://rss.itunes.apple.com/api/v1/us/ios-apps/top-paid/all/100/explicit.json")
    ]
    
    func getWebService(index: Int) {
        // 1. WEB URL
        //let url = NSURL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/10/explicit.json")
        let url = NSURL(string: urls[index])
        // 2. Make a URL Request
        let urlRequest = URLRequest(url: url! as URL)
        // 3. Create a Session
        let session = URLSession.shared
        // 4. Make a request over session
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil else {return}
                guard let data = data else {return}
                do {
                    let parseData = try JSONSerialization.jsonObject(with: data, options: .allowFragments)  as? [String:Any]
                    
                    self.dataDict = parseData!["feed"]! as! NSDictionary
                    self.appsData = self.dataDict["results"]! as! [NSDictionary]
                    
                    for f in self.appsData {
                        self.a.append(App(title: f["name"]! as! String, imageURL: f["artworkUrl100"]! as! String, artist:  f["artistName"]! as! String))
                    }
                }
                catch let error {
                    print(error.localizedDescription)
                }
            }
        })
        task.resume()
    }
}

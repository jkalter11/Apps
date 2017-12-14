//
//  AppsDisplayVC.swift
//  Apps
//
//  Created by Murari Varma on 13/12/17.
//  Copyright © 2017 Murari Varma. All rights reserved.
//

import UIKit

class AppsDisplayVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var appsCollection: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private(set) public var apps = [App]()
    
    var indexSelected: IndexPath? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appsCollection.dataSource = self
        self.appsCollection.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if apps.count == 0 {
            initApps(indexPath: indexSelected!)
        }
    }
    
    func initApps(indexPath: IndexPath) {
        
        // Download file or perform expensive task
        self.activityIndicator.startAnimating()
        
        DataService.instance.getWebService(index: indexPath.row)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            // Download file or perform expensive task
            
            DispatchQueue.main.async {
                // Update the UI
                self.apps = DataService.instance.a
                self.appsCollection.reloadData()
                self.activityIndicator.stopAnimating()
                
            }
        }
        navigationItem.title = DataService.instance.getCategories()[(indexPath.row)].title
    }
    
    // Mark: - UICollectionView Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppsCell", for: indexPath) as? AppsCell {
            
            cell.updateViews(app: apps[indexPath.row])
            return cell
        } else {
            return AppsCell()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

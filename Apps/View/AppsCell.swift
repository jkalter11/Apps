//
//  AppsCell.swift
//  Apps
//
//  Created by Murari Varma on 13/12/17.
//  Copyright © 2017 Murari Varma. All rights reserved.
//

import UIKit

class AppsCell: UICollectionViewCell {

    @IBOutlet weak var appImage: UIImageView!
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var appArtist: UILabel!
    
    
    
    private var image: UIImage?
    
    private func fetchImage(imageURL: String?) {
        if let url = URL(string: imageURL!) {
            
            // this code blocks the UI until the image is loaded.
            // this code should run in a different thread.
            
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                let urlContents = try? Data(contentsOf: url)
                if let imageData = urlContents {
                    DispatchQueue.main.async {
                        self?.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }

    func updateViews(app: App) {
        fetchImage(imageURL: app.imageURL)
        appImage.image = self.image
        appTitle.text = app.title
        appArtist.text = app.artist
    }
}

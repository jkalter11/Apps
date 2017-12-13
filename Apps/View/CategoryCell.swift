//
//  CategoryCell.swift
//  Apps
//
//  Created by Murari Varma on 13/12/17.
//  Copyright © 2017 Murari Varma. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryText: UILabel!
    
    func updateViews(category: Category) {
        categoryImage.image = UIImage(named:category.imageName)
        categoryText.text = category.title
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

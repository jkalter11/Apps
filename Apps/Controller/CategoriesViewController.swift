//
//  ViewController.swift
//  Apps
//
//  Created by Murari Varma on 13/12/17.
//  Copyright © 2017 Murari Varma. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var categoryTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTable.rowHeight = 180
        categoryTable.dataSource = self
        categoryTable.delegate = self
    }
    
    // Mark: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell {
            
            let categoryData = DataService.instance.getCategories()[indexPath.row]
            cell.updateViews(category: categoryData)
            
            return cell
        }
        
        return CategoryCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "AppsDisplaySegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AppsDisplaySegue" {
            guard let viewController = segue.destination as? AppsDisplayVC else {return}
            
            let barButton = UIBarButtonItem()
            barButton.title = ""
            navigationItem.backBarButtonItem = barButton
            navigationItem.backBarButtonItem?.tintColor = UIColor.white
            
            viewController.indexSelected = sender as? IndexPath
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


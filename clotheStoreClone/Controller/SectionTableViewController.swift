//
//  SectionTableViewController.swift
//  clotheStoreClone
//
//  Created by Terry Bridges on 03/07/2019.
//  Copyright © 2019 Terry Bridges. All rights reserved.
//

import UIKit

class SectionTableViewController: UITableViewController {
    
    let sectionLabel = ["NEW IN", "CLOTHING", "SHOES", "ACCESSORIES", "ACTIVEWEAR", "FACE + BODY", "LIVING + GIFTS", "BRANDS", "OUTLET"]
    var secitonImages: [UIImage] = [
        UIImage(named: "newin")!,
        UIImage(named: "clothing")!,
        UIImage(named: "activewear")!
    ]
    let cellSpacing: CGFloat = 20
    //let sectionImages = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 135.0
        tableView.separatorStyle = .none
        
        
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return secitonImages.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        cell.labelCell.text = sectionLabel[indexPath.section]
        cell.imgCell.image = secitonImages[indexPath.section]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacing
    }
    
}

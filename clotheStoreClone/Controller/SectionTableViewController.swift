//
//  SectionTableViewController.swift
//  clotheStoreClone
//
//  Created by Terry Bridges on 03/07/2019.
//  Copyright © 2019 Terry Bridges. All rights reserved.
//

import UIKit

class SectionTableViewController: UITableViewController {
    
    var segmentControlIndex = 1
    let cellSpacing: CGFloat = 20
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 135.0
        tableView.separatorStyle = .none
    
        setSegmentStyles()
        
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        
    }
    

    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            segmentControlIndex = 1
            print(segmentControlIndex)
        } else {
            segmentControlIndex = 2
            print(segmentControlIndex)
        }
        
        tableView.reloadData()
    }
    
    let sectionLabel = ["NEW IN", "CLOTHING", "SHOES", "ACCESSORIES", "ACTIVEWEAR", "FACE + BODY", "LIVING + GIFTS", "BRANDS", "OUTLET"]
    var menImages: [UIImage] = [
        UIImage(named: "newin")!,
        UIImage(named: "clothing")!,
        UIImage(named: "menShoes")!,
        UIImage(named: "menAccess")!,
        UIImage(named: "activewear")!,
        UIImage(named: "menFace")!,
        UIImage(named: "menGift")!,
        UIImage(named: "brands")!,
        UIImage(named: "menOutlet")!
    ]
    
    var womanImages: [UIImage] = [
        UIImage(named: "womenNewin")!,
        UIImage(named: "womenClothing")!,
        UIImage(named: "womenShoes")!,
        UIImage(named: "womenAccess")!,
        UIImage(named: "womenActivewear")!,
        UIImage(named: "womensFace")!,
        UIImage(named: "womenGift")!,
        UIImage(named: "brands")!,
        UIImage(named: "womenOutlet")!
    ]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return menImages.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        cell.labelCell.text = sectionLabel[indexPath.section]
        
        if segmentControlIndex == 1 {
            
            cell.imgCell.image = womanImages[indexPath.section]
            print(segmentControlIndex)
            
        } else {
            
            cell.imgCell.image = menImages[indexPath.section]
            print(segmentControlIndex)
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacing
    }
    
    
    func setSegmentStyles() {
        segmentControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "DINCondensed-bold", size: 22),
            NSAttributedString.Key.foregroundColor : UIColor.lightGray
            ], for: .normal)
        
        segmentControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "DINCondensed-Bold", size: 18),
            NSAttributedString.Key.foregroundColor: UIColor.orange
            ], for: .selected)
        
        segmentControl.frame = CGRect(x: segmentControl.frame.origin.x, y: segmentControl.frame.origin.y, width: segmentControl.frame.size.width, height: 50);
    }
    
}

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
    var tableData = TableData()
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        
        setSegmentStyles()
        setTableStyles()
        
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
            segmentControlIndex = 1
            segmentControl.selectedSegmentIndex = 0
            print(segmentControlIndex)
            tableView.reloadData()
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
            segmentControlIndex = 2
            segmentControl.selectedSegmentIndex = 1
            print(segmentControlIndex)
            tableView.reloadData()
        }
        
    }

    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            segmentControlIndex = 1
        } else {
            segmentControlIndex = 2
        }
        
        tableView.reloadData()
    }
    

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.menImages.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        cell.labelCell.text = tableData.sectionLabel[indexPath.section]
        
        if segmentControlIndex == 1 {
            cell.imgCell.image = tableData.womanImages[indexPath.section]
        } else {
            cell.imgCell.image = tableData.menImages[indexPath.section]
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func setTableStyles() {
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        
        tableView.rowHeight = 135.0
        tableView.separatorStyle = .none
        
    }
    
    
    func setSegmentStyles() {
        segmentControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "DINCondensed-bold", size: 24),
            NSAttributedString.Key.foregroundColor : UIColor.lightGray
            ], for: .normal)
        
        segmentControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "DINCondensed-bold", size: 18),
            NSAttributedString.Key.foregroundColor: UIColor.orange
            ], for: .selected)
        
        segmentControl.frame = CGRect(x: segmentControl.frame.origin.x, y: segmentControl.frame.origin.y, width: segmentControl.frame.size.width, height: 50);
    }
    
}

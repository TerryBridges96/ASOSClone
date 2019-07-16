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
    let cellSpacing: CGFloat = 155
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
            tableView.reloadData()
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
            segmentControlIndex = 2
            segmentControl.selectedSegmentIndex = 1
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.sectionLabel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        cell.labelCell.text = tableData.sectionLabel[indexPath.row]
        
        if segmentControlIndex == 1 {
            cell.imgCell.image = tableData.womanImages[indexPath.row]
        } else {
            cell.imgCell.image = tableData.menImages[indexPath.row]
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellSpacing
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ClothesView

        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.dataRecieved = tableData.sectionLabel[indexPath.row]
            
            if segmentControlIndex == 1 {
                destinationVC.imageRecieved = tableData.womanImages[indexPath.row]
            } else if segmentControlIndex == 2 {
                destinationVC.imageRecieved = tableData.menImages[indexPath.row]
            }
        }
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

//
//  WebsitesHeaderTableViewCell.swift
//  miniProjectUI
//
//  Created by Shanju Ebanesh K on 18/04/22.
//

import UIKit

class WebsitesHeaderTableViewCell: UITableViewCell {

    
    @IBOutlet weak var arrowIcon: UIImageView!
    @IBOutlet weak var whitelistedButton: UIButton!
    @IBOutlet weak var appNameLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        whitelistedButton.setImage(UIImage(named: "goldenStar"), for: .selected)
        whitelistedButton.setImage(UIImage(named: "star"), for: .normal)
    }
    
    @IBAction func whitelistButtonTapped(_ sender: AnyObject) {
    
        whitelistedButton.isSelected = !whitelistedButton.isSelected
        
        //finding the  indexPath of the cell which contains the tapped button
        let cell = sender.superview?.superview as! WebsitesHeaderTableViewCell
        let tableView = cell.superview as? UITableView
        let indexPath = tableView?.indexPath(for: cell)!
        
        if let section = (indexPath?.section){
            WebsitesData.websitesData.websiteCollection[section].isWhiteListed = whitelistedButton.isSelected
        }
        
    }
    
    
    func setName(as name : String){
        appNameLabel.text = name
    }
    
    //function to set the arrowIcon image
    func setIcon(as image: UIImage?){
        arrowIcon.image = image
    }
    
    
    //function for setting the whitelisted state
    func setWhitelistState(as state : UIButton.State){
        if state == .selected{
            whitelistedButton.isSelected = true
        }else{
            whitelistedButton.isSelected = false
        }
    }
}

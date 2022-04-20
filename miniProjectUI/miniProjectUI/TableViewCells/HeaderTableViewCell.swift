//
//  HeaderTableViewCell.swift
//  miniProjectUI
//
//  Created by Shanju Ebanesh K on 18/04/22.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var arrowIcon: UIImageView!
    @IBOutlet weak var appGenereLabel: UILabel!
    @IBOutlet weak var whitelistedButton: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        whitelistedButton.setImage(UIImage(named: "goldenStar"), for: .selected)
        whitelistedButton.setImage(UIImage(named: "star"), for: .normal)
    }
    
    //changing the state of isWhiteListed in the app Genere and the state of the button whenever it is tapped
    @IBAction func whitelistedButtonTapped(_ sender: AnyObject) {
        whitelistedButton.isSelected = !whitelistedButton.isSelected
        
        //finding the  indexPath of the cell which contains the tapped button
        let cell = sender.superview?.superview as! HeaderTableViewCell
        let tableView = cell.superview as? UITableView
        let indexPath = tableView?.indexPath(for: cell)!
        
        if let section = (indexPath?.section){
            AppsData.appsData.appCollection[section].isWhiteListed = whitelistedButton.isSelected
        }
    }
    
    
    //function to set the text for appGenereLabel
    func setName(as name : String){
        appGenereLabel.text = name
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

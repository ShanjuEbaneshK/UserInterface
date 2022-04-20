//
//  AppsTableViewCell.swift
//  miniProjectUI
//
//  Created by Shanju Ebanesh K on 17/04/22.
//

import UIKit

class AppsTableViewCell: UITableViewCell {

    //outlets for the icons and labels in the cell
    @IBOutlet weak private var appIconImageView: UIImageView!
    @IBOutlet weak private var appNameLabel: UILabel!
    @IBOutlet weak private var storeIconImageView: UIImageView!
    @IBOutlet weak private var ageLimitLabel: UILabel!
    
    
    //removing the icons and age limit values when reusing the cells
    override func prepareForReuse() {
        super.prepareForReuse()
        setIcon(as: nil)
        setStoreIcon(as: nil)
        setAgeLimit(as: nil)
        
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //resizing the image in the appIconImageView
        appIconImageView.contentMode = .scaleAspectFit
        
        //adding the curves to the ageLimitLabel
        ageLimitLabel.layer.masksToBounds = true
        ageLimitLabel.layer.cornerRadius = 5
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    
    //function to set the appNameLabel text
    func setName(as name: String){
        appNameLabel.text = name
    }
    
    //function to set the appIconImageView image
    func setIcon(as image: UIImage?){
        appIconImageView.image = image
    }
    
    //function to set the storeIconImageView image
    func setStoreIcon(as image: UIImage?){
        storeIconImageView.image = image
    }
    
    //function to set the ageLimitLabel text
    func setAgeLimit(as ageLimit: Int?){
        if let ageLimit = ageLimit {
            ageLimitLabel.text = "\(ageLimit)+ "
            ageLimitLabel.layer.masksToBounds = true
            ageLimitLabel.layer.cornerRadius = 5
        }else{
            ageLimitLabel.text = ""
        }
    }
    
    
    
    
}

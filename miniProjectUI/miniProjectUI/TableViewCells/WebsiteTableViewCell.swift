//
//  WebsiteTableViewCell.swift
//  miniProjectUI
//
//  Created by Shanju Ebanesh K on 18/04/22.
//

import UIKit

class WebsiteTableViewCell: UITableViewCell {

    @IBOutlet weak var WebsiteNameLabel: UILabel!
    @IBOutlet weak var ageLimitLabel: UILabel!
    
    func setName(as name: String){
        WebsiteNameLabel.text = name
    }
    
    func setAgeLimit(as ageLimit: Int?){
        if let ageLimit = ageLimit {
            ageLimitLabel.text = "\(ageLimit)+"
        }
        else{
            ageLimitLabel.text = ""
        }
    }
    
}

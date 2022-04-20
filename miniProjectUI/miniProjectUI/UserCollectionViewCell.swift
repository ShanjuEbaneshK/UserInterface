//
//  UserCollectionViewCell.swift
//  miniProjectUI
//
//  Created by Shanju Ebanesh K on 16/04/22.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bottomImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    //creating a image view to display the user profile picture
    let topImageView : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func prepareForReuse() {
        bottomImageView.image = nil
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        bottomImageView.addSubview(topImageView)
        
        topImageView.frame = CGRect(x: 0, y: 0, width: bottomImageView.frame.width, height: bottomImageView.frame.width)
        applyConstraints()
        
        //adding the curve to the top and bottom image view
        topImageView.layer.cornerRadius = (topImageView.frame.height/2)
        topImageView.clipsToBounds = true
        topImageView.contentMode = .scaleAspectFill
        
        bottomImageView.clipsToBounds = false
        bottomImageView.layer.cornerRadius = bottomImageView.frame.height/2
    }
    
    //function to draw an normal image in grayscale
    func convertToGrayScale(image: UIImage) -> UIImage {
        
        let imageRect:CGRect = CGRect(x:0, y:0, width:image.size.width, height: image.size.height)
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let width = image.size.width
        let height = image.size.height
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        context?.draw(image.cgImage!, in: imageRect)
        let imageRef = context!.makeImage()
        let newImage = UIImage(cgImage: imageRef!)
        return newImage
        
    }
    
    
    //function to set the profile picture of the user in the top image view for selected user(the image will not be grayscaled)
    func setSelectedImage(_ image : UIImage){
        
        //setting normal image for the top view image
        topImageView.image = image

        //setting the solid shadow for the bottom image view
        bottomImageView.layer.shadowOffset = CGSize(width: -5, height: -5)
        bottomImageView.layer.shadowRadius = 0
        bottomImageView.layer.shadowOpacity = 1
        bottomImageView.layer.shadowColor = UIColor.init(red: 0.14, green: 0.65, blue: 1, alpha: 1).cgColor
        let shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: bottomImageView.bounds.width + 10, height: bottomImageView.bounds.height + 10), cornerRadius: bottomImageView.frame.height / 2 + 5)
        bottomImageView.layer.shadowPath = shadowPath.cgPath

        bottomImageView.layer.borderColor = UIColor.white.cgColor
        bottomImageView.layer.borderWidth = 5
        
    }
    
    
    //function to set the profile picture of the user in the top image view for unselected user(the image will be grayscaled)
    func setUnselectedImage(_ image : UIImage){
        
        //setting grayscaled image for the top image view
        topImageView.image = convertToGrayScale(image: image)
        
        //setting the black shadow for the bottom image view
        bottomImageView.layer.borderColor = UIColor.white.cgColor
        bottomImageView.layer.borderWidth = 2
        bottomImageView.layer.shadowColor = UIColor.black.cgColor
        bottomImageView.layer.shadowOpacity = 0.3
        bottomImageView.layer.shadowOffset = CGSize.zero
        bottomImageView.layer.shadowRadius = 8
        bottomImageView.layer.shadowPath = UIBezierPath(roundedRect: bottomImageView.bounds, cornerRadius: bottomImageView.frame.height/2).cgPath
        
    }
    
    
    //function to create constraints for the top image view
    func applyConstraints(){
        
        topImageView.centerXAnchor.constraint(equalTo: bottomImageView.centerXAnchor).isActive = true
        topImageView.centerYAnchor.constraint(equalTo: bottomImageView.centerYAnchor).isActive = true
        topImageView.widthAnchor.constraint(equalTo: bottomImageView.widthAnchor, constant: -5).isActive = true
        topImageView.heightAnchor.constraint(equalTo: bottomImageView.heightAnchor, constant: -5).isActive = true
    }

}

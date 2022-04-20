//
//  userData.swift
//  miniProjectUI
//
//  Created by Shanju Ebanesh K on 16/04/22.
//

import Foundation
import UIKit

class user{             //class containing the details of individual users
    
    var name : String           //name of the user
    var imageName : String      //name of the image representing the profile picture of the user
    
    init(name : String, imageName: String){     //initializer
        self.name = name
        self.imageName = imageName
    }
}

class UsersData{            //singleton class containing the collection of users to be displayed in collection view
    
    static let usersData = UsersData()
    
    private init(){}
    
    var users : [user] = [      //creating the collection of users
        user(name: "Alex", imageName: "image1"),
        user(name: "Bob", imageName: "image2"),
        user(name: "Catherine", imageName: "image3"),
        user(name: "David", imageName: "image4"),
        user(name: "Eva", imageName: "image5"),
        user(name: "Fabila", imageName: "image6"),
        user(name: "Genevia", imageName: "image7"),
        user(name: "Hera", imageName: "image8"),
        user(name: "Ila", imageName: "image9"),
        user(name: "Julie", imageName: "image10"),
        user(name: "Kattie", imageName: "image11"),
        user(name: "Lucy", imageName: "image12"),
        user(name: "Manchy", imageName: "image13"),
        user(name: "Nena", imageName: "image14"),
        user(name: "Percy", imageName: "image15")
    ]
    
}

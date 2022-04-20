//
//  WebsitesData.swift
//  miniProjectUI
//
//  Created by Shanju Ebanesh K on 18/04/22.
//

import Foundation

class websiteDetails{       //class containing details of individual websites
    
    var name : String               //name of the website
    var ageLimit : Int              //integer representing the age limit of the website
    
    init(name: String, ageLimit: Int){     //initializer
        self.name = name
        self.ageLimit = ageLimit
    }
    
}

class websitesGenere{                    //a class containing an collection of website under the same genre
    
    var genereName : String         //genere name of the collection
    var websites : [websiteDetails]         //array of apps in that collection
    var isOpen : Bool = false       //a boolean value to represent if the class is expanded while displaying in the table view
    var isWhiteListed : Bool
    
    init(genereName : String, websites : [websiteDetails], isWhiteListed: Bool = false){     //initializer
        self.websites = websites
        self.genereName = genereName
        self.isWhiteListed = isWhiteListed
    }
    
}

class WebsitesData{                     //singleton class containing the group of appGenere to be displayed in the table View
    
    static let websitesData = WebsitesData()
    
    var websiteCollection : [websitesGenere] = [         //creating the group of appGeneres
        websitesGenere(genereName: "Art and design",
                  websites: [
                    websiteDetails(name: "Instagram", ageLimit: 13),
                    websiteDetails(name: "Instagram", ageLimit: 13),
                    websiteDetails(name: "Pintrest", ageLimit: 13),
                    websiteDetails(name: "Adobe Photoshop", ageLimit: 13),
                    websiteDetails(name: "Adobe Photoshop", ageLimit: 13)
                  ]),
        websitesGenere(genereName: "Social Media",
                  websites: [
                    websiteDetails(name: "Facebook", ageLimit: 13),
                    websiteDetails(name: "Whatsapp", ageLimit: 13),
                    websiteDetails(name: "Snapchat", ageLimit: 13),
                    websiteDetails(name: "Whatsapp", ageLimit: 13),
                    websiteDetails(name: "Instagram", ageLimit: 13),
                    websiteDetails(name: "Snapchat", ageLimit: 13)
                  ]),
        websitesGenere(genereName: "Education",
                    websites: [
                    websiteDetails(name: "LinkedIn", ageLimit: 13),
                    websiteDetails(name: "Swift Playgrounds", ageLimit: 13),
                    websiteDetails(name: "Khan Academy", ageLimit: 13),
                    websiteDetails(name: "LinkedIn", ageLimit: 13),
                    websiteDetails(name: "Khan Academty", ageLimit: 13)
                  ]),
        websitesGenere(genereName: "Shoppping",
                       websites: [
                    websiteDetails(name: "SnapDeal", ageLimit: 13),
                    websiteDetails(name: "Amazon", ageLimit: 13),
                    websiteDetails(name: "Myntra", ageLimit: 13),
                    websiteDetails(name: "SnapDeal", ageLimit: 13),
                    websiteDetails(name: "Amazon", ageLimit: 13)
                  ],
                isWhiteListed: true),
        websitesGenere(genereName: "Online Payment",
                       websites: [
                    websiteDetails(name: "Amazon Pay", ageLimit: 13),
                    websiteDetails(name: "Google Pay", ageLimit: 13),
                    websiteDetails(name: "Apple Pay", ageLimit: 13),
                    websiteDetails(name: "PayPal", ageLimit: 13),
                    websiteDetails(name: "Paytm", ageLimit: 13)
                  ]),
        websitesGenere(genereName: "Books and References",
                       websites: [
                    websiteDetails(name: "iBooks", ageLimit: 5),
                    websiteDetails(name: "Duolingo", ageLimit: 13),
                    websiteDetails(name: "Khan Academy", ageLimit: 13),
                    websiteDetails(name: "Khan Academy", ageLimit: 13),
                    websiteDetails(name: "Amazon Kindle", ageLimit: 13),
                    websiteDetails(name: "Duolingo", ageLimit: 13)
                  ]),
        websitesGenere(genereName: "Entertainment",
                       websites: [
                    websiteDetails(name: "Prime Video", ageLimit: 11),
                    websiteDetails(name: "Netflix", ageLimit: 13),
                    websiteDetails(name: "Netflix", ageLimit: 13),
                    websiteDetails(name: "Prime Video", ageLimit: 11),
                    websiteDetails(name: "YouTube", ageLimit: 13)
                  ]),
        websitesGenere(genereName: "Designing",
                       websites: [
                    websiteDetails(name: "Instagram", ageLimit: 13),
                    websiteDetails(name: "Instagram", ageLimit: 13),
                    websiteDetails(name: "Pintrest", ageLimit: 13),
                    websiteDetails(name: "Adobe Photoshop", ageLimit: 13),
                    websiteDetails(name: "Adobe Photoshop", ageLimit: 13)
                  ],
                    isWhiteListed: true),
        websitesGenere(genereName: "Communication Apps",
                       websites: [
                    websiteDetails(name: "Facebook", ageLimit: 13),
                    websiteDetails(name: "Whatsapp", ageLimit: 13),
                    websiteDetails(name: "Snapchat", ageLimit: 13),
                    websiteDetails(name: "Whatsapp", ageLimit: 13),
                    websiteDetails(name: "Instagram", ageLimit: 13),
                    websiteDetails(name: "Snapchat", ageLimit: 13)
                  ]),
        websitesGenere(genereName: "Payment Apps",
                       websites: [
                    websiteDetails(name: "Amazon Pay", ageLimit: 13),
                    websiteDetails(name: "Google Pay", ageLimit: 13),
                    websiteDetails(name: "Apple Pay", ageLimit: 13),
                    websiteDetails(name: "PayPal", ageLimit: 13),
                    websiteDetails(name: "Paytm", ageLimit: 13)
                  ])
    ]
    
    private init(){}
    
    
}

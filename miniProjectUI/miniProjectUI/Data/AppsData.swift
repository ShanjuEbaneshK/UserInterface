//
//  AppsData.swift
//  miniProjectUI
//
//  Created by Shanju Ebanesh K on 17/04/22.
//

import Foundation

class appDetails{       //class containing details of individual apps
    
    var name : String               //name of the app
    var tagLine : String            //tagline for the app
    var imageName : String          //name of the image representing the app logo
    var availableDevice : String    //name of the image representing the available device
    var ageLimit : Int              //integer representing the age limit of the app
    
    init(name: String, tagLine: String, imageName: String, availableDevice: String, ageLimit: Int){     //initializer
        self.name = name
        self.tagLine = tagLine
        self.imageName = imageName
        self.availableDevice = availableDevice
        self.ageLimit = ageLimit
    }
    
}

class appGenere{                    //a class containing an collection of apps under the same genre
    
    var genereName : String         //genere name of the collection
    var apps : [appDetails]         //array of apps in that collection
    var isOpen : Bool = false       //a boolean value to represent if the class is expanded while displaying in the table view
    var isWhiteListed : Bool
    
    init(genereName : String, apps : [appDetails], isWhiteListed: Bool = false){     //initializer
        self.apps = apps
        self.genereName = genereName
        self.isWhiteListed = isWhiteListed
    }
    
}

class AppsData{                     //singleton class containing the group of appGenere to be displayed in the table View
    
    static let appsData = AppsData()
    
    var appCollection : [appGenere] = [         //creating the group of appGeneres
        appGenere(genereName: "Art and design",
                  apps: [
                    appDetails(name: "Instagram", tagLine: "Sketch a day", imageName: "Instagram", availableDevice: "android", ageLimit: 13),
                     appDetails(name: "Instagram", tagLine: "Story of the day", imageName: "Instagram", availableDevice: "ios", ageLimit: 13),
                     appDetails(name: "Pintrest", tagLine: "Upload your arts", imageName: "Pintrest", availableDevice: "android", ageLimit: 13),
                     appDetails(name: "Adobe Photoshop", tagLine: "Edit an image", imageName: "Photoshop", availableDevice: "android", ageLimit: 13),
                     appDetails(name: "Adobe Photoshop", tagLine: "Create a template", imageName: "Photoshop", availableDevice: "ios", ageLimit: 13)
                  ]),
        appGenere(genereName: "Social Media",
                  apps: [
                    appDetails(name: "Facebook", tagLine: "See whats around you", imageName: "Facebook", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Whatsapp", tagLine: "Chat with friends", imageName: "Whatsapp", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Snapchat", tagLine: "Send a snap", imageName: "Snapchat", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Whatsapp", tagLine: "Call your friends", imageName: "Whatsapp", availableDevice: "android", ageLimit: 13),
                    appDetails(name: "Instagram", tagLine: "See whats around you", imageName: "Instagram", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Snapchat", tagLine: "Maintain the streak", imageName: "Snapchat", availableDevice: "android", ageLimit: 13)
                  ]),
        appGenere(genereName: "Education",
                  apps: [
                    appDetails(name: "LinkedIn", tagLine: "Get certified courses", imageName: "Linkedin", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Swift Playgrounds", tagLine: "Develop an application", imageName: "Swift", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Khan Academy", tagLine: "Improve your knowledge", imageName: "Khan", availableDevice: "android", ageLimit: 13),
                    appDetails(name: "LinkedIn", tagLine: "Learn new skills", imageName: "Linkedin", availableDevice: "android", ageLimit: 13),
                    appDetails(name: "Khan Academty", tagLine: "Improve your knowledge", imageName: "Khan", availableDevice: "ios", ageLimit: 13)
                  ],
                  isWhiteListed: true),
        appGenere(genereName: "Shoppping",
                  apps: [
                    appDetails(name: "SnapDeal", tagLine: "Buy on a click", imageName: "Snapdeal", availableDevice: "android", ageLimit: 13),
                    appDetails(name: "Amazon", tagLine: "One day delivery", imageName: "Amazon", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Myntra", tagLine: "Shop Fashion", imageName: "Mytra", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "SnapDeal", tagLine: "All you need", imageName: "Snapdeal", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Amazon", tagLine: "Fastest delivery", imageName: "Amazon", availableDevice: "android", ageLimit: 13)
                  ]),
        appGenere(genereName: "Online Payment",
                  apps: [
                    appDetails(name: "Amazon Pay", tagLine: "Pay your electricity Bill", imageName: "Amazon", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Google Pay", tagLine: "Scan and pay", imageName: "Gpay", availableDevice: "android", ageLimit: 13),
                    appDetails(name: "Apple Pay", tagLine: "Buy an editing app", imageName: "Applepay", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "PayPal", tagLine: "Link a bank account", imageName: "Paypal", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Paytm", tagLine: "Pay fast by QR", imageName: "Paytm", availableDevice: "android", ageLimit: 13)
                  ]),
        appGenere(genereName: "Books and References",
                  apps: [
                    appDetails(name: "iBooks", tagLine: "Refer a book", imageName: "Ibooks", availableDevice: "ios", ageLimit: 5),
                    appDetails(name: "Duolingo", tagLine: "Learn a new Language", imageName: "Duolingo", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Khan Academy", tagLine: "Clarify your doubts", imageName: "Khan", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Khan Academy", tagLine: "Ask teachers", imageName: "Khan", availableDevice: "android", ageLimit: 13),
                    appDetails(name: "Amazon Kindle", tagLine: "Read story books", imageName: "Amazon", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Duolingo", tagLine: "Languages are interesting", imageName: "Duolingo", availableDevice: "android", ageLimit: 13)
                  ],
                 isWhiteListed: true),
        appGenere(genereName: "Entertainment",
                  apps: [
                    appDetails(name: "Prime Video", tagLine: "Watch your favourite Series", imageName: "Amazon", availableDevice: "ios", ageLimit: 11),
                    appDetails(name: "Netflix", tagLine: "Watch the recent movies", imageName: "Netflix", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Netflix", tagLine: "Watch the latest series", imageName: "Netflix", availableDevice: "android", ageLimit: 13),
                    appDetails(name: "Prime Video", tagLine: "Watch Movies", imageName: "Amazon", availableDevice: "android", ageLimit: 11),
                    appDetails(name: "YouTube", tagLine: "Watch shorts", imageName: "Youtube", availableDevice: "android", ageLimit: 13)
                  ]),
        appGenere(genereName: "Designing",
                  apps: [
                    appDetails(name: "Instagram", tagLine: "Sketch a day", imageName: "Instagram", availableDevice: "android", ageLimit: 13),
                     appDetails(name: "Instagram", tagLine: "Story of the day", imageName: "Instagram", availableDevice: "ios", ageLimit: 13),
                     appDetails(name: "Pintrest", tagLine: "Upload your arts", imageName: "Pintrest", availableDevice: "android", ageLimit: 13),
                     appDetails(name: "Adobe Photoshop", tagLine: "Edit an image", imageName: "Photoshop", availableDevice: "android", ageLimit: 13),
                     appDetails(name: "Adobe Photoshop", tagLine: "Create a template", imageName: "Photoshop", availableDevice: "ios", ageLimit: 13)
                  ]),
        appGenere(genereName: "Communication Apps",
                  apps: [
                    appDetails(name: "Facebook", tagLine: "See whats around you", imageName: "Facebook", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Whatsapp", tagLine: "Chat with friends", imageName: "Whatsapp", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Snapchat", tagLine: "Send a snap", imageName: "Snapchat", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Whatsapp", tagLine: "Call your friends", imageName: "Whatsapp", availableDevice: "android", ageLimit: 13),
                    appDetails(name: "Instagram", tagLine: "See whats around you", imageName: "Instagram", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Snapchat", tagLine: "Maintain the streak", imageName: "Snapchat", availableDevice: "android", ageLimit: 13)
                  ]),
        appGenere(genereName: "Payment Apps",
                  apps: [
                    appDetails(name: "Amazon Pay", tagLine: "Pay your electricity Bill", imageName: "Amazon", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Google Pay", tagLine: "Scan and pay", imageName: "Gpay", availableDevice: "android", ageLimit: 13),
                    appDetails(name: "Apple Pay", tagLine: "Buy an editing app", imageName: "Applepay", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "PayPal", tagLine: "Link a bank account", imageName: "Paypal", availableDevice: "ios", ageLimit: 13),
                    appDetails(name: "Paytm", tagLine: "Pay fast by QR", imageName: "Paytm", availableDevice: "android", ageLimit: 13)
                  ])
    ]
    
    private init(){}
    
    
}

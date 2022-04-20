//
//  SecondViewController.swift
//  miniProjectUI
//
//  Created by Shanju Ebanesh K on 17/04/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    var selectedApp : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpNavigationBar()
    }
    
    //function to set up the navigation bar title and right bar button
    func setUpNavigationBar(){
        
        //creating the right bar button item with the bell image
        let bellIcon = UIBarButtonItem(image: UIImage(systemName: "bell.badge"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
        bellIcon.tintColor = .black
        navigationItem.rightBarButtonItem = bellIcon
        
        //if there is a selected app, set the title as the apps name
        if let selectedApp = selectedApp{
            title = selectedApp
        }
        //if there is no selected app, set the title as the latest selected user in the collection view in the view controller
        else{
            title = UsersData.usersData.users[ViewController.selectedUser.row].name
        }
    }

}

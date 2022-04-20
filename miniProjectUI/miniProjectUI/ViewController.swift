//
//  ViewController.swift
//  miniProjectUI
//
//  Created by Shanju Ebanesh K on 16/04/22.
//

//View Controller with a collection View at the top and a table View at the bottom.
//It also acts as the data source and delegates for both the table and collection views

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!            //outlet for the collection view
    @IBOutlet weak var tableView: UITableView!                      //outlet for the table view
    
    @IBOutlet weak var appsButton: UIButton!                        //outlets for the two buttons in the centre
    @IBOutlet weak var websiteButton: UIButton!
    
    static var selectedUser = IndexPath(row: 0, section: 0)         //variable to store the current selected user in the collection view
    
    var stateOfTable = state.apps       //variable to store the state of the table view
    
    enum state{                 //enum of the states of the table view
        case apps
        case websites
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButtons()
        setUpNavigationBar()
        setDataSourcesAndDelegates()
        
        //setting the default selected item in the collection view
        collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .top)
    }
    
    
    //changing the appearances of the buttons when they are clicked
    @IBAction func appsButtonClicked(_ sender: Any) {
        
        appsButton.tintColor = .systemGray6
        appsButton.setTitleColor(.darkGray, for: .normal)
        
        websiteButton.tintColor = .clear
        websiteButton.setTitleColor(.gray, for: .normal)
        
        //reloading the tableView everytime the stateOfTable is changed
        if stateOfTable != .apps{
            stateOfTable = .apps
            tableView.reloadData()
            tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
    
    
    //changing the appearances of the buttons when they are clicked
    @IBAction func websitesButtonClicked(_ sender: Any) {
        websiteButton.tintColor = .systemGray6
        websiteButton.setTitleColor(.darkGray, for: .normal)
        
        appsButton.tintColor = .clear
        appsButton.setTitleColor(.gray, for: .normal)
        
        //reloading the tableView everytime the stateOfTable is changed
        if stateOfTable != .websites{
            stateOfTable = .websites
            tableView.reloadData()
            tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
    
    
    //function to create a left bar button in the navigation bar with the hamburger menu icon
    func configureMenuButton(){
        
        //creating an imageView with the hamburger menu icon
        let imageView : UIImageView = {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.image = UIImage(named: "menuButton")
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        //assigning the created image view to the left bar button item
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: imageView)
        
        //adding constraints to the button item's view
        navigationItem.leftBarButtonItem?.customView?.widthAnchor.constraint(equalToConstant: 40).isActive = true
        navigationItem.leftBarButtonItem?.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    //function to set up the nvigation controller
    func setUpNavigationBar(){
        //creating a bar button item with bell icon
        let bellIcon = UIBarButtonItem(image: UIImage(systemName: "bell.badge"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
        bellIcon.tintColor = .black
        
        //assigning the bell bar button item as the right bar buttom item
        navigationItem.rightBarButtonItem = bellIcon
        configureMenuButton()
        
        //setting up the titles for the current page
        title = "Content filter"
        navigationItem.backButtonTitle = "Back"
    }
    
    
    //function to set the data sources and delegates of the table and collection views
    func setDataSourcesAndDelegates(){
        
        tableView.dataSource = self
        tableView.delegate = self
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    //function to set up the appearances of the button
    func setUpButtons(){
        
        appsButton.setTitle("Apps", for: .normal)
        appsButton.tintColor = .systemGray6
        appsButton.setTitleColor(.darkGray, for: .normal)

        
        websiteButton.setTitle("Websites", for: .normal)
        websiteButton.tintColor = .clear
        websiteButton.setTitleColor(.darkGray, for: .normal)
    }

}


//Adding Data source functions for the collection view
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
   
    //MARK: UICollectionViewDataSouce Delegate Methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return UsersData.usersData.users.count          //returning the count of the users in the users array
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! UserCollectionViewCell
        
        //assignung the name of the user to the nameLabel in the cell
        cell.nameLabel.text = UsersData.usersData.users[indexPath.row].name
        
        //assigning the image of the user to the imageView in the cell
        //if the current cell contains the selected user, set as color image using setSelectedImage method
        if indexPath == ViewController.selectedUser{
            cell.setSelectedImage(UIImage(named: UsersData.usersData.users[indexPath.row].imageName)!)
        }
        //if not set the image in grayscale with a shadow in the background using setUnselectedImage method
        else{
            cell.setUnselectedImage(UIImage(named: UsersData.usersData.users[indexPath.row].imageName)!)
        }
        return cell
    }
    
    
    //MARK: UICollectionViewDelegate Delegate Methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //getting the cell at the selected indexPath
        let cell = collectionView.cellForItem(at: indexPath) as? UserCollectionViewCell
        
        //assigning the indexpath to the variable storing the indexpath of the selected user
        ViewController.selectedUser = indexPath
        
        //setting the image of the selected cell as color image
        cell?.setSelectedImage(UIImage(named: UsersData.usersData.users[indexPath.row].imageName)!)
        
        //pushing new view controller to the navigation controller
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        //getting the cell at the deselected indexPath
        let cell = collectionView.cellForItem(at: indexPath) as? UserCollectionViewCell
        
        //setting the image of the unselected cell in grayscale with the shadow
        cell?.setUnselectedImage(UIImage(named: UsersData.usersData.users[indexPath.row].imageName)!)
    }
    
}


//Adding Data source functions for the table view
extension ViewController: UITableViewDataSource, UITableViewDelegate{
   
    //MARK: UITableViewDataSouce Delegate Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        
        //if the state of table is apps, return the count of app generes in the appsdata
        if stateOfTable == .apps{
            return AppsData.appsData.appCollection.count
        }
        //if not, return the count of website generes in the websitedata
        else{
            return WebsitesData.websitesData.websiteCollection.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //if state of table is apps, calculate the number of rows for the appsdata
        if stateOfTable == .apps{
            //if the app genere at the section is open, returning the count of apps in the genere + 1(for the genere title)
            if AppsData.appsData.appCollection[section].isOpen{
                return AppsData.appsData.appCollection[section].apps.count + 1
            }
            //if the app genere at the section is closed, returning 1(for the genere title)
            else{
                return 1
            }
        }
        //if not calculate the number of rows for the websitesdata
        else{
            if WebsitesData.websitesData.websiteCollection[section].isOpen{
                return WebsitesData.websitesData.websiteCollection[section].websites.count + 1
            }
            else{
                return 1
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //if the state of the table is apps, load data from the appsdata
        if stateOfTable == .apps{
            if indexPath.row != 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! AppsTableViewCell
        
                //if the row is not 0, it is not a genere title. Assign name, image, availableDeviceIcon, ageLimit of the cells from the app details
        
                cell.setName(as: AppsData.appsData.appCollection[indexPath.section].apps[indexPath.row - 1].tagLine)
                cell.setIcon(as: UIImage(named: AppsData.appsData.appCollection[indexPath.section].apps[indexPath.row - 1].imageName))
                cell.setStoreIcon(as: UIImage(named: AppsData.appsData.appCollection[indexPath.section].apps[indexPath.row - 1].availableDevice))
                cell.setAgeLimit(as: AppsData.appsData.appCollection[indexPath.section].apps[indexPath.row - 1].ageLimit)
                return cell
            }
            //if not it is a genere title. Assign the title name and arrow up or down to the image
            else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "headingTableViewCell", for: indexPath) as! HeaderTableViewCell
                cell.setName(as: AppsData.appsData.appCollection[indexPath.section].genereName)
                if AppsData.appsData.appCollection[indexPath.section].isOpen{
                    cell.setIcon(as: UIImage(systemName: "chevron.up")?.withTintColor(.black))
                }else{
                    cell.setIcon(as: UIImage(systemName: "chevron.down")?.withTintColor(.black))
                }
            
                //assigning golden star if the app genere is whitelisted. if not assigning a gray star
                if AppsData.appsData.appCollection[indexPath.section].isWhiteListed{
                    cell.setWhitelistState(as: UIButton.State.selected)
                }else{
                    cell.setWhitelistState(as: UIButton.State.normal)
                }
                return cell
            }
            
        }
        //if not, load the data from the websitesdata
        else{
            //if the row is not 0, it is not a genere title. Assign name, ageLimit of the cells from the website details
            if indexPath.row != 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "WebsitetableViewCell", for: indexPath) as! WebsiteTableViewCell
        
                cell.setName(as: WebsitesData.websitesData.websiteCollection[indexPath.section].websites[indexPath.row - 1].name)
                cell.setAgeLimit(as: WebsitesData.websitesData.websiteCollection[indexPath.section].websites[indexPath.row - 1].ageLimit)
                return cell
            }
            //if not it is a genere title. Assign the title name and arrow up or down to the image
            else{
               
                let cell = tableView.dequeueReusableCell(withIdentifier: "websiteHeadingTableViewCell", for: indexPath) as! WebsitesHeaderTableViewCell
                
                cell.setName(as: WebsitesData.websitesData.websiteCollection[indexPath.section].genereName)
                
                if WebsitesData.websitesData.websiteCollection[indexPath.section].isOpen{
                    cell.setIcon(as: UIImage(systemName: "chevron.up")?.withTintColor(.black))
                }else{
                    cell.setIcon(as: UIImage(systemName: "chevron.down")?.withTintColor(.black))
                }
            
                //assigning golden star if the app genere is whitelisted. if not assigning a gray star
                if WebsitesData.websitesData.websiteCollection[indexPath.section].isWhiteListed{
                    cell.setWhitelistState(as: UIButton.State.selected)
                }else{
                    cell.setWhitelistState(as: UIButton.State.normal)
                }
                return cell
            }
        }
        
    }
    
    
    //setting the height of the rows in the table view
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //MARK: UITableViewDelegate Delegate Methods

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //if the state of the table is in apps, get inputs from appsdata
        if stateOfTable == .apps{
            //If a cell at row 0 is selected, the app genere is selected. So open and close the genere based on its previous state
            if indexPath.row == 0{
            
                //inverting the open state of the app genere and reloading the table
                AppsData.appsData.appCollection[indexPath.section].isOpen = !AppsData.appsData.appCollection[indexPath.section].isOpen
                tableView.reloadSections([indexPath.section], with: .automatic)
            
            }
            //if not, an app is selected and a new view controller is pushed with the app name in its title
            else{
                let secondVC = SecondViewController()
                secondVC.selectedApp = AppsData.appsData.appCollection[indexPath.section].apps[indexPath.row-1].name
                navigationController?.pushViewController(secondVC, animated: true)
            }
            
        }
        //if not, get inputs from websitesdata
        else{
            if indexPath.row == 0{
                //inverting the open state of the website genere and reloading the table
                WebsitesData.websitesData.websiteCollection[indexPath.section].isOpen = !WebsitesData.websitesData.websiteCollection[indexPath.section].isOpen
                tableView.reloadSections([indexPath.section], with: .automatic)
            
            }
            //if not, website is selected and a new view controller is pushed with the website name in its title
            else{
                let secondVC = SecondViewController()
                secondVC.selectedApp = WebsitesData.websitesData.websiteCollection[indexPath.section].websites[indexPath.row-1].name
                navigationController?.pushViewController(secondVC, animated: true)
            }
        }
    }
}

//
//  UsersViewController.swift
//  DMNetworkingIntro
//
//  Created by David Ruvinskiy on 4/10/23.
//

import UIKit

/**
 1. Create the user interface. See the provided screenshot for how the UI should look.
 2. Follow the instructions in the `User` file.
 3. Follow the instructions in the `NetworkManager` file.
 */
class UsersViewController: UIViewController, UITableViewDataSource, NetworkManagerDelegate, UITableViewDelegate {
   
    
    
    /**
     4. Create a variable called `users` and set it to an empty array of `User` objects.
     */
    var users: [User] = []
    
    /**
     5. Connect the UITableView to the code. Create a function called `configureTableView` that configures the table view. You may find the `Constants` file helpful. Make sure to call the function in the appropriate spot.
     */
    
    @IBOutlet weak var usersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
        configureTableView()
    }
    
    func configureTableView() {
        usersTableView.dataSource = self
        usersTableView.delegate = self
    }
    
    func getUsers() {
        NetworkManager.shared.getUsers()
        NetworkManager.shared.delegate = self
    }
   
    func usersRetrieved(users: [User]) {
        self.users = users

               DispatchQueue.main.async {
                   self.usersTableView.reloadData()
                   }
        
           }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.userReuseID, for: indexPath)
        let user = users[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = user.firstName
        content.secondaryText = user.lastName
        content.secondaryText = user.email
        cell.contentConfiguration = content
        return cell
    }
    /**
     6.1 Set the `NetworkManager`'s delegate property to the `UsersViewController`. Have the `UsersViewController` conform to the `NetworkManagerDelegate` protocol. Call the `NetworkManager`'s `getUsers` function. In the `usersRetrieved` function, assign the `users` property to the array we got back from the API and call `reloadData` on the table view.
     */
        
    
        
    

}



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
class UsersViewController: UIViewController, UITableViewDataSource, NetworkManagerDelegate {
    func usersRetrieved(_ users: [User]) {
        self.users = users //

               DispatchQueue.main.async {
                   self.UITableView.reloadData()
                   }
        
           }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Email", for: indexPath)
        return cell
    }
    
    
    /**
     4. Create a variable called `users` and set it to an empty array of `User` objects.
     */
    var users: [User] = []
    /**
     5. Connect the UITableView to the code. Create a function called `configureTableView` that configures the table view. You may find the `Constants` file helpful. Make sure to call the function in the appropriate spot.
     */
    
    @IBOutlet weak var UITableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUsers()
    }
    func configureTableView() {
        UITableView.dataSource = self
        UITableView.register(UITableViewCell.self, forCellReuseIdentifier: "PersonCell")    }
    /**
     6.1 Set the `NetworkManager`'s delegate property to the `UsersViewController`. Have the `UsersViewController` conform to the `NetworkManagerDelegate` protocol. Call the `NetworkManager`'s `getUsers` function. In the `usersRetrieved` function, assign the `users` property to the array we got back from the API and call `reloadData` on the table view.
     */
        
    func getUsers() {
        
    }
        
    

}



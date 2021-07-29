//
//  MyFavoritePasswordsTableViewController.swift
//  iPass
//
//  Created by Apple on 23/07/2021.
//

import UIKit
import Firebase
class MyFavoritePasswordsTableViewController: UITableViewController {

    var favoriteStoredAccounts = [ItemCell]()
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
        loadSavedAccounts()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

        

    }
    
    
    func loadSavedAccounts() {
        
        db.collection("StoredPasswords")
            .addSnapshotListener { (querySnapshot, error) in
            
            // to prevent duplicate loading...
            self.favoriteStoredAccounts = []
            
            if let e = error {
                print("There was an issue retrieving data from Firestore. \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        
                        if let applicationName = data["applicationName"] as? String,
                           let email = data["email"] as? String,
                           let iconName = data["iconName"] as? String,
                           let isFavorite = data["isFavorite"] as? Bool,
                           let password = data["password"] as? String,
                           let savedAccountOwner = data["savedAccountOwner"] as? String,
                           let website = data["website"] as? String
                        {
                            if isFavorite == true && savedAccountOwner ==  Auth.auth().currentUser?.email
                            {
                            
                                let loadedStoredAccount = ItemCell(email, password, applicationName, iconName, isFavorite, savedAccountOwner, website)
                                self.favoriteStoredAccounts.append(loadedStoredAccount!)
                            }
                            DispatchQueue.main.async {
                            self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favoriteStoredAccounts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFavoriteReusableCell", for: indexPath) as! MyFavoritePasswordsTableViewCell
        
        let item = favoriteStoredAccounts[indexPath.row]

        cell.FavoriteAppName.text = item.applicationName
        cell.FavoriteMail.text = item.email
        cell.FavoriteImageView.image = UIImage(named: "\(item.iconName ?? "Default")")

        
        return cell
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

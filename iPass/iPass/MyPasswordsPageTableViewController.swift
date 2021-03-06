//
//  MyPasswordsPageTableViewController.swift
//  iPass
//
//  Created by Apple on 22/07/2021.
//

import UIKit
import Firebase
class MyPasswordsPageTableViewController: UITableViewController, UISearchBarDelegate {

    let db = Firestore.firestore()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var loadedStoredAccounts = [ItemCell]()
    var filteredData = [ItemCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        navigationItem.hidesBackButton = true
        
        loadSavedAccounts()
        
        filteredData = loadedStoredAccounts
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

        
    }
    
    
    func loadSavedAccounts() {
        
        db.collection("StoredPasswords")
            .addSnapshotListener { (querySnapshot, error) in
            
            // to prevent duplicate loading...
            self.loadedStoredAccounts = []
            
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
                            if isFavorite == false && savedAccountOwner ==  Auth.auth().currentUser?.email
                            {
                            
                                let loadedStoredAccount = ItemCell(email, password, applicationName, iconName, isFavorite, savedAccountOwner, website)
                                self.loadedStoredAccounts.append(loadedStoredAccount!)
                            }
                            
                            DispatchQueue.main.async {
                                
                                self.filteredData = self.loadedStoredAccounts
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

        return filteredData.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyReusableCell", for: indexPath) as! MyPasswordsTableViewCell
        

        let item = filteredData[indexPath.row]

        cell.AppNameInCell.text = item.applicationName
        cell.EmailInCell.text = item.email
        cell.MyImageInCell.image = UIImage(named: "\(item.iconName)")

        return cell
    }
    
    
    // this below commented method is working for case of needing to delete a row
    // but it has code implementation for "Delete" only ( just 1 option) ... so I wrote an alternative
    // which has more options
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//         if (editingStyle == UITableViewCell.EditingStyle.delete)
//         {
//
//            let recordToRemove = loadedStoredAccounts[indexPath.row]
//
////            self.db.collection("StoredPasswords").whereField("applicationName", isEqualTo: "\(String(describing: recordToRemove.applicationName))")
//            db.collection("StoredPasswords").getDocuments { (snapshot, err) in
//
//                for document in snapshot!.documents {
//                    let data = document.data()
//
//                    if let applicationName = data["applicationName"] as? String,
//                       let email = data["email"] as? String,
//                       let _ = data["iconName"] as? String,
//                       let isFavorite = data["isFavorite"] as? Bool,
//                       let password = data["password"] as? String,
//                       let savedAccountOwner = data["savedAccountOwner"] as? String,
//                       let website = data["website"] as? String
//                    {
//                        if applicationName == recordToRemove.applicationName &&
//                            email == recordToRemove.email && isFavorite == recordToRemove.isFavorite
//                            && password == recordToRemove.password && savedAccountOwner == recordToRemove.savedAccountOwner
//                            && website == recordToRemove.website{
//
//                            self.db.collection("StoredPasswords").document("\(document.documentID)").delete() {
//                                err in if let err = err {
//                                    print("Error removing document: \(err)")
//                                } else {
//                                    print("Document successfully removed!")
//                                }
//                            }
//
//                        }
//                    }
//                }
//            }
//            loadedStoredAccounts.remove(at: indexPath.row)
//
//            self.tableView.reloadData()
//         }
//
//     }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [self] (action, view, completion) in
            
            
            let alert = UIAlertController(title: nil, message: "Are you sure you want to delete this item?", preferredStyle: .alert)

                // yes action
                let yesAction = UIAlertAction(title: "Yes", style: .default) { _ in
                        let recordToRemove = loadedStoredAccounts[indexPath.row]
            
            //            self.db.collection("StoredPasswords").whereField("applicationName", isEqualTo: "\(String(describing: recordToRemove.applicationName))")
                        db.collection("StoredPasswords").getDocuments { (snapshot, err) in
            
                            for document in snapshot!.documents {
                                let data = document.data()
            
                                if let applicationName = data["applicationName"] as? String,
                                   let email = data["email"] as? String,
                                   let _ = data["iconName"] as? String,
                                   let isFavorite = data["isFavorite"] as? Bool,
                                   let password = data["password"] as? String,
                                   let savedAccountOwner = data["savedAccountOwner"] as? String,
                                   let website = data["website"] as? String
                                {
                                    if applicationName == recordToRemove.applicationName &&
                                        email == recordToRemove.email && isFavorite == recordToRemove.isFavorite
                                        && password == recordToRemove.password && savedAccountOwner == recordToRemove.savedAccountOwner
                                        && website == recordToRemove.website{
            
                                        self.db.collection("StoredPasswords").document("\(document.documentID)").delete() {
                                            err in if let err = err {
                                                print("Error removing document: \(err)")
                                            } else {
                                                print("Document successfully removed!")
                                            }
                                        }
            
                                    }
                                }
                            }
                        }
                        loadedStoredAccounts.remove(at: indexPath.row)
            
                        self.tableView.reloadData()
            
                        completion(true)
                }
            
            alert.addAction(yesAction)

             // cancel action
             alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

             present(alert, animated: true, completion: nil)
        }
        
        let favoriteAction = UIContextualAction(style: .normal, title: "Favorite") { [self] (action, view, completion) in
            
            let recordAddedToFavorites = loadedStoredAccounts[indexPath.row]

//            self.db.collection("StoredPasswords").whereField("applicationName", isEqualTo: "\(String(describing: recordToRemove.applicationName))")
            db.collection("StoredPasswords").getDocuments { (snapshot, err) in

                for document in snapshot!.documents {
                    let data = document.data()

                    if let applicationName = data["applicationName"] as? String,
                       let email = data["email"] as? String,
                       let _ = data["iconName"] as? String,
                       let isFavorite = data["isFavorite"] as? Bool,
                       let password = data["password"] as? String,
                       let savedAccountOwner = data["savedAccountOwner"] as? String,
                       let website = data["website"] as? String
                    {
                        if applicationName == recordAddedToFavorites.applicationName &&
                            email == recordAddedToFavorites.email && isFavorite == recordAddedToFavorites.isFavorite
                            && password == recordAddedToFavorites.password && savedAccountOwner == recordAddedToFavorites.savedAccountOwner
                            && website == recordAddedToFavorites.website{

                            self.db.collection("StoredPasswords").document("\(document.documentID)").updateData([
                                "isFavorite": true
                            ]) { err in
                                if let err = err {
                                    print("Error updating document: \(err)")
                                } else {
                                    print("Document successfully updated")
                                }
                            }

                        }
                    }
                }
            }
            loadedStoredAccounts.remove(at: indexPath.row)
            self.tableView.reloadData()
            completion(true)
        }
        
        favoriteAction.backgroundColor = .systemYellow
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction, favoriteAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        
        case "passwordDetails":
            
            // get reference to destination ViewController object
            guard let itemDetailViewController = segue.destination as? PasswordDetailsViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedItemCell = sender as? MyPasswordsTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedItemCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedItem = loadedStoredAccounts[indexPath.row]

            // set item property of itemDetailViewController
            itemDetailViewController.selectedItem = selectedItem
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    @IBAction func unwindToPasswordList(sender: UIStoryboardSegue) {
    
        if let sourceViewController = sender.source as? PasswordDetailsViewController,
           let newPassword = sourceViewController.newPassword {
            // here I have the item, need to update corresponding table cell
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
               
                if (loadedStoredAccounts[selectedIndexPath.row].password == newPassword)
                {
                    // password was not changed
                    print()
                }
                else
                {
                    
                    let recordToUpdate =  loadedStoredAccounts[selectedIndexPath.row]
                    
                    db.collection("StoredPasswords").getDocuments { [self] (snapshot, err) in
                        
                        for document in snapshot!.documents {
                            let data = document.data()
                            
                            if let applicationName = data["applicationName"] as? String,
                               let email = data["email"] as? String,
                               let _ = data["iconName"] as? String,
                               let isFavorite = data["isFavorite"] as? Bool,
                               let password = data["password"] as? String,
                               let savedAccountOwner = data["savedAccountOwner"] as? String,
                               let website = data["website"] as? String
                            {
                                if applicationName == recordToUpdate.applicationName &&
                                    email == recordToUpdate.email && isFavorite == recordToUpdate.isFavorite
                                    && password == recordToUpdate.password && savedAccountOwner == recordToUpdate.savedAccountOwner
                                    && website == recordToUpdate.website{
                                    
                                    self.loadedStoredAccounts[selectedIndexPath.row].password = newPassword
                                    
                                    self.db.collection("StoredPasswords").document("\(document.documentID)").updateData([
                                        "password": newPassword
                                    ]) { err in
                                        if let err = err {
                                            print("Error updating document: \(err)")
                                        } else {
//                                            print("Document successfully updated")
                                            print("Password successfully changed!")
                                        }
                                    }
                                    
                                }
                            }
                        }
                    }
                    
                }
                
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                print("error unwinding")
            }
                
    }
    }
    
    
    
    
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
    
    
    // Search bar configuration
    
    // whenever text inside search bar changes, run this function
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        
        
        if searchText == ""
        {
            filteredData = loadedStoredAccounts
        }
        else{
        for account in loadedStoredAccounts {
            
            if account.applicationName.lowercased().contains(searchText.lowercased()) {
                filteredData.append(account)
            }
            }
        }
        self.tableView.reloadData()
    }

}

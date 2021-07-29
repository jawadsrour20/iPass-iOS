//
//  MyPasswordsPageTableViewController.swift
//  iPass
//
//  Created by Apple on 22/07/2021.
//

import UIKit
import Firebase
class MyPasswordsPageTableViewController: UITableViewController {

    let db = Firestore.firestore()
    
    var loadedStoredAccounts = [ItemCell]()
    
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
        return loadedStoredAccounts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyReusableCell", for: indexPath) as! MyPasswordsTableViewCell
        
        let item = loadedStoredAccounts[indexPath.row]
        
        cell.AppNameInCell.text = item.applicationName
        cell.EmailInCell.text = item.email
        cell.MyImageInCell.image = UIImage(named: "\(item.iconName)")

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if (editingStyle == UITableViewCell.EditingStyle.delete)
         {
             
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
         }
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
    
    @IBAction func unwindToItemList(sender: UIStoryboardSegue) {
    
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
                                            print("Document successfully updated")
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

}

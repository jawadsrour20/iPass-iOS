//
//  MyFavoritePasswordsTableViewController.swift
//  iPass
//
//  Created by Apple on 23/07/2021.
//

import UIKit

class MyFavoritePasswordsTableViewController: UITableViewController {

    var favoriteItems = [ItemCell]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let img1 = UIImage(named:"twitter")
        let img2 = UIImage(named:"google")
        let item1 = ItemCell("Google","mfa68@gmail.com",img1)
        let item2 = ItemCell("Facebook","dee01@aub.com",img2)
        let item3 = ItemCell("Google","mfa68@gmail.com",img1)
        let item4 = ItemCell("Facebook","dee01@aub.com",img2)
        let item5 = ItemCell("Google","mfa68@gmail.com",img1)
        let item6 = ItemCell("Facebook","dee01@aub.com",img2)
        let item7 = ItemCell("Google","mfa68@gmail.com",img1)
        let item8 = ItemCell("Facebook","dee01@aub.com",img2)
        let item9 = ItemCell("Google","mfa68@gmail.com",img1)
        let item10 = ItemCell("Facebook","dee01@aub.com",img2)
        
        favoriteItems += [item1,item2,item3,item4,item5,item6,item7,item8,item9,item10,item2,item2,item2,item2,item2,item2,item2,item2,item2,item2,item2,item2,item2]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favoriteItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFavoriteReusableCell", for: indexPath) as! MyFavoritePasswordsTableViewCell
        
        let item = favoriteItems[indexPath.row]
        
        cell.FavoriteAppName.text = item.AppName
        cell.FavoriteMail.text = item.Mail
        cell.FavoriteImageView.image = item.ImageView
        // Configure the cell...

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

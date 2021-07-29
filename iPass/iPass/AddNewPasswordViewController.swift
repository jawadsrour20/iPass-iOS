//
//  AddNewPasswordViewController.swift
//  iPass
//
//  Created by Apple on 21/07/2021.
//

import UIKit
import Firebase
class AddNewPasswordViewController: UIViewController {

    
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var horizontallyScrollableSV: UIStackView!
    
    @IBOutlet weak var websiteName: MyCustomTextField!
    @IBOutlet weak var applicationName: MyCustomTextField!
    @IBOutlet weak var userEmail: MyCustomTextField!
    @IBOutlet weak var userPassword: MyCustomTextField!

    
    
    var icons = [UIButton]()
    let TwitterImg = UIImage(named:"Twitter")
    let AirbnbImg = UIImage(named:"Airbnb")
    let AmazonImg = UIImage(named:"Amazon")
    let AppleIDImg = UIImage(named:"AppleID")
    let DiscordImg = UIImage(named:"Discord")
    let DribbleImg = UIImage(named:"Dribble")
    let DropboxImg = UIImage(named:"Dropbox")
    let EbayImg = UIImage(named:"Ebay")
    let EvernoteImg = UIImage(named:"Evernote")
    let FacebookImg = UIImage(named:"Facebook")
    let GithubImg = UIImage(named:"Github")
    let GoogleImg = UIImage(named:"Google")
    let InstagramImg = UIImage(named:"Instagram")
    let LinkedinImg = UIImage(named:"Linkedin")
    let MessengerImg = UIImage(named:"Messenger")
    let OperaImg = UIImage(named:"Opera")
    let OutlookImg = UIImage(named:"Outlook")
    let PinterestImg = UIImage(named:"Pinterest")
    let RedditImg = UIImage(named:"Reddit")
    let SkypeImg = UIImage(named:"Skype")
    let SnapchatImg = UIImage(named:"Snapchat")
    let SonyImg = UIImage(named:"Sony")
    let StackoverflowImg = UIImage(named:"Stackoverflow")
    let SteamImg = UIImage(named:"Steam")
    let TelegramImg = UIImage(named:"Telegram")
    let TeslaImg = UIImage(named:"Tesla")
    let UberImg = UIImage(named:"Uber")
    let XboxImg = UIImage(named:"Xbox")
    let YahooImg = UIImage(named:"Yahoo")
    let YoutubeImg = UIImage(named:"Youtube")
    let ZoomImg = UIImage(named:"Zoom")
    
    @objc
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        
        loadIcons()
      
        // Do any additional setup after loading the view.
    }
    
    

    func loadIcons() {
 
        
        for _ in 0...30{
            icons += [UIButton()]
        }
     
        
        icons[0].setBackgroundImage(OutlookImg, for: .normal)
        icons[1].setBackgroundImage(YoutubeImg, for: .normal)
        icons[2].setBackgroundImage(AmazonImg, for: .normal)
        icons[3].setBackgroundImage(StackoverflowImg, for: .normal)
        icons[4].setBackgroundImage(GithubImg, for: .normal)
        icons[5].setBackgroundImage(GoogleImg, for: .normal)
        icons[6].setBackgroundImage(FacebookImg, for: .normal)
        icons[7].setBackgroundImage(InstagramImg, for: .normal)
        icons[8].setBackgroundImage(TwitterImg, for: .normal)
        icons[9].setBackgroundImage(YahooImg, for: .normal)
        icons[10].setBackgroundImage(XboxImg, for: .normal)
        icons[11].setBackgroundImage(TeslaImg, for: .normal)
        icons[12].setBackgroundImage(UberImg, for: .normal)
        icons[13].setBackgroundImage(TelegramImg, for: .normal)
        icons[14].setBackgroundImage(SteamImg, for: .normal)
        icons[15].setBackgroundImage(AppleIDImg, for: .normal)
        icons[16].setBackgroundImage(SonyImg, for: .normal)
        icons[17].setBackgroundImage(SnapchatImg, for: .normal)
        icons[18].setBackgroundImage(SkypeImg, for: .normal)
        icons[19].setBackgroundImage(RedditImg, for: .normal)
        icons[20].setBackgroundImage(OperaImg, for: .normal)
        icons[21].setBackgroundImage(ZoomImg, for: .normal)
        icons[22].setBackgroundImage(PinterestImg, for: .normal)
        icons[23].setBackgroundImage(LinkedinImg, for: .normal)
        icons[24].setBackgroundImage(MessengerImg, for: .normal)
        icons[25].setBackgroundImage(EbayImg, for: .normal)
        icons[26].setBackgroundImage(EvernoteImg, for: .normal)
        icons[27].setBackgroundImage(AirbnbImg, for: .normal)
        icons[28].setBackgroundImage(DiscordImg, for: .normal)
        icons[29].setBackgroundImage(DribbleImg, for: .normal)
        icons[30].setBackgroundImage(DropboxImg, for: .normal)
        
   
        icons[0].titleLabel?.text = "Outlook"
        icons[1].titleLabel?.text = "Youtube"
        icons[2].titleLabel?.text = "Amazon"
        icons[3].titleLabel?.text = "Stackoverflow"
        icons[4].titleLabel?.text = "Github"
        icons[5].titleLabel?.text = "Google"
        icons[6].titleLabel?.text = "Facebook"
        icons[7].titleLabel?.text = "Instagram"
        icons[8].titleLabel?.text = "Twitter"
        icons[9].titleLabel?.text = "Yahoo"
        icons[10].titleLabel?.text = "Xbox"
        icons[11].titleLabel?.text = "Tesla"
        icons[12].titleLabel?.text = "Uber"
        icons[13].titleLabel?.text = "Telegram"
        icons[14].titleLabel?.text = "Steam"
        icons[15].titleLabel?.text = "AppleId"
        icons[16].titleLabel?.text = "Sony"
        icons[17].titleLabel?.text = "Snapchat"
        icons[18].titleLabel?.text = "Skype"
        icons[19].titleLabel?.text = "Reddit"
        icons[20].titleLabel?.text = "Opera"
        icons[21].titleLabel?.text = "Zoom"
        icons[22].titleLabel?.text = "Pinterest"
        icons[23].titleLabel?.text = "Linkedin"
        icons[24].titleLabel?.text = "Messenger"
        icons[25].titleLabel?.text = "Ebay"
        icons[26].titleLabel?.text = "Evernote"
        icons[27].titleLabel?.text = "Airbnb"
        icons[28].titleLabel?.text = "Discord"
        icons[29].titleLabel?.text = "Dribble"
        icons[30].titleLabel?.text = "Dropbox"
        
        for icon in icons{
        icon.widthAnchor.constraint(equalToConstant: 60).isActive=true
            icon.addTarget(self, action: #selector(AddNewPasswordViewController.iconButtonSelected(_:)), for: .touchUpInside)
            icon.titleLabel?.isHidden = true
        horizontallyScrollableSV.addArrangedSubview(icon)
        }
    }
    @objc func iconButtonSelected(_ button: UIButton){
            
        for icon in icons{
            icon.layer.borderWidth = 0
            icon.layer.borderColor = nil
            
        }
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.blue.cgColor
        
        }

    @IBAction func saveAccount(_ sender: Any) {
        
        var chosenIcon: String = "Default"
        for icon in icons{
            if icon.layer.borderWidth == 1 {
                chosenIcon = icon.titleLabel?.text ?? "Default"
                break
            }
        }
        
        if let tempWebsite = websiteName.text, let tempApplicationName = applicationName.text,
           let tempAccountEmail = userEmail.text, let tempAccountPassword = userPassword.text,
           let storedAccountOwner = Auth.auth().currentUser?.email
        {
            db.collection("StoredPasswords")
                .addDocument(data:[
                    "applicationName": tempApplicationName,
                    "email": tempAccountEmail,
                    "iconName": chosenIcon,
                    "isFavorite": false,
                    "password": tempAccountPassword,
                    "savedAccountOwner": storedAccountOwner,
                    "website": tempWebsite
            ]) { (error) in
                    if let e = error {
                        print("There was an issue saving data to firestore, \(e)")
                    } else {
                        print("Successfully saved data.")
                        
                        // specify that main thread is to do this resetting work to avoid any errors
                        DispatchQueue.main.async {
                            self.websiteName.text = ""
                            self.applicationName.text = ""
                            self.userEmail.text = ""
                            self.userPassword.text = ""
                            chosenIcon = "Default"
                        }
                    }
                }
        }
    }
    
}

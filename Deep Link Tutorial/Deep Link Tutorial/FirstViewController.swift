//
//  FirstViewController.swift
//  Deep Link Tutorial
//
//  Created by Arthur Rodrigues on 15/06/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func createLink() {
        
        let secretNameVC = "SecretViewController"
        
        // Enconding secret name as url and with query allowed
        guard let secretNameAsURL = secretNameVC.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        // Creating our app path
        let openAppPath = "tutorial://deep-link?appFirstScreen=\(secretNameAsURL)"
        
        // openAppPath as URL
        guard let appURL = URL(string: openAppPath) else { return }
        
        // Present activity controller to share our link
        presentActivityController(url: appURL)
    }
    
    func presentActivityController(url: URL) {
        
        // This is the message that will be sent. If you want to send the link with some message, just write below on message variable
        let message = ""
        
        // The share content with the message you want and the URL
        let shareContent: [Any] = [message, url]

        let activityController = UIActivityViewController(activityItems: shareContent,
                                                          applicationActivities: nil)
        
        self.present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func didShareButtonPressed(_ sender: UIButton) {
        createLink()
    }
    

}

//
//  SceneDelegate.swift
//  Deep Link Tutorial
//
//  Created by Arthur Rodrigues on 15/06/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        for urlContext in connectionOptions.urlContexts {
            
            // 1 - If entered with URL, we will get it
            let url = urlContext.url
            
            let host = url.host
            
            // Link that I'm using: "tutorial://deep-link?appFirstScreen=\(secretNameAsURL)"
            
            // 2- Checking if the host that we put at the link is correct
            if host == "deep-link" {
                
                if let windowScene = scene as? UIWindowScene {
                    
                    // 3 - Here I used this little extension to query a string parameters and check if the appFirstScreen parameters at the URL is "SecretViewController". If is, we can initialize with it.
                    let appFirstScreenParameter = url.getQueryStringParameter(url: url.absoluteString, param: "appFirstScreen")
                    
                    // 4 - Check if the parameter we received is "SecretViewController"
                    if appFirstScreenParameter == "SecretViewController" {
                        
                        // 5 - Can initialize with SecretViewController
                        let window = UIWindow(windowScene: windowScene)
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let secretVC = storyboard.instantiateViewController(identifier: "secretVC")
                        
                        // 6 - RootViewController will be set as the secretVC
                        window.rootViewController = secretVC
                        self.window = window
                    }
                }
            }
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


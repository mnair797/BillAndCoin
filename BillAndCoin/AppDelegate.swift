//
//  AppDelegate.swift
//  BillAndCoin
//
//  Created by Nisha Narayanakurup on 11/3/20.
//  Copyright © 2020 Meenakshi Nair. All rights reserved.
//


import AVFoundation
import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        do {
          let s=2
          print("Starting sleep",s)
          let utterance = AVSpeechUtterance(string: "Welcome!")
          utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
          utterance.rate = 0.5

          let synthesizer = AVSpeechSynthesizer()
          synthesizer.speak(utterance)
          sleep(UInt32(s))
          print("Finished sleep for ",s)
            
          }
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
      // Called when a new scene session is being created.
      // Use this method to select a configuration to create the new scene with.
      return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


//
//  AppDelegate.swift
//  arina-scan
//
//  Created by Ademie  on 05/10/2023.
//
//This will be invoked on app launch
import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate{
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
//       uncomment this line if you want to use local emulator
        setupFirebaseLocalEmulator()
        return true
    }
    
    func setupFirebaseLocalEmulator(){
        var host = "127.0.0.1"
        #if !targetEnvironment(simulator)
        host = "192.168.43.19"
        #endif
        
        //local emulator settings
        let settings = Firestore.firestore().settings
        settings.host = "\(host):8080"
        settings.cacheSettings = MemoryCacheSettings()
        settings.isSSLEnabled = false
        
        Storage.storage().useEmulator(withHost: host, port: 9199)
        
    }
    
    
}



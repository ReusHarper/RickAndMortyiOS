//
//  AppDelegate.swift
//  Animations
//
//  Created by ReusHarper on 04/11/22.
//

import UIKit
import Network

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var internetStatus = false
    var internetType = ""
    
    // 1. la aplicación ya se lanzó
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let monitor = NWPathMonitor()
        // closure: Es un bloque de código que se ejecuta de maner asyncrona (funciones anónimas)
        monitor.pathUpdateHandler = { path in
            // path es un argumento que llega a la función
            if path.status != .satisfied {
                self.internetStatus = false
            }
            else {
                self.internetStatus = true
             // TODO: si hay internet, checar de que tipo
                if path.usesInterfaceType(.wifi) {
                    self.internetType = "WIFI"
                }
                else if path.usesInterfaceType(.cellular) {
                    self.internetType = "CELL"
                }
            }
        }
        //
        monitor.start(queue: DispatchQueue.global())
        return true
    }
    // 2. El usuario se va a cambiar de app (o llegó una interrupción del s.o. ej. una llamada
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    // 3. La app ya no está activa
    func applicationDidEnterBackground(_ application: UIApplication) {
 
    }
    // 4. La app va a volver a primer plano
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    // 5. La app ya está activa nuevamente
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


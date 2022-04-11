//
//  AppDelegate.swift
//  TextureInjection
//
//  Created by M. Alfiansyah Nur Cahya Putra on 11/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        #if DEBUG
            #if os(macOS)
            let bundleName = "macOSInjection.bundle"
            #elseif os(tvOS)
            let bundleName = "tvOSInjection.bundle"
            #elseif targetEnvironment(simulator)
            let bundleName = "iOSInjection.bundle"
            #else
            let bundleName = "maciOSInjection.bundle"
            #endif
            Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/"+bundleName)!.load()
        #endif
        return true
    }
}


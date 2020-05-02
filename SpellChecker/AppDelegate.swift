//
//  Copyright © 2020 Rafael Claycon Schmitt
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let itemStore = ItemStore()

        let navController = window!.rootViewController as! UINavigationController
        let itemsController = navController.topViewController as! ItemsViewController
        itemsController.itemStore = itemStore
        
        itemStore.allItems.append(Item(name: "Accio", description: "Summons an object towards the caster."))
        itemStore.allItems.append(Item(name: "Aguamenti", description: "Produces a clean, drinkable jet of water from the wand tip."))
        itemStore.allItems.append(Item(name: "Alohomora", description: "Unlocks doors and other objects."))
        itemStore.allItems.append(Item(name: "Aresto Momentum", description: "Decreases the velocity of a moving target."))
        itemStore.allItems.append(Item(name: "Bombarda", description: "Provokes a small explosion."))
        itemStore.allItems.append(Item(name: "Diffindo", description: "Used to precisely cut or tear objects."))

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


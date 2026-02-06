//
//  QR_CardsApp.swift
//  QR Cards
//
//  Created by Erica Heiermann on 31/10/2025.
//

import SwiftUI
import Firebase

// from firebase
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct QR_CardsApp: App {
    @StateObject var viewModel = AuthViewModel()
    @StateObject var dataManager = DataManager()
    
    //from firebase
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

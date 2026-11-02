//
//  TesterConcurrencyApp.swift
//  TesterConcurrency
//
//  Created by amglobal on 10/22/26.
//

import SwiftUI

@main
struct TesterConcurrencyApp: App {
    
    let myActor = MyNetworkActor()
    let myDBActor = MyDatabaseActor()
    
    var body: some Scene {
        WindowGroup {
            ContentView(myActor: myActor, myDBActor: myDBActor)
        }
    }
}

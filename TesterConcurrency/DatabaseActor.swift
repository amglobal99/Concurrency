//
//  DatabaseActor.swift
//  TesterConcurrency
//
//  Created by amglobal on 11/2/26.
//

import Foundation



@globalActor
actor DatabaseActor {
    public static let shared = DatabaseActor()
}



@DatabaseActor
class MyDatabaseActor {
    
    let name = "MyDatabaseActor"
    
    func performDatabaseTask()  async {
        // Bind the name at the top-level task entry point of the actor
         await CurrentActorTracker.$value.withValue(self.name) {
             await getElectionDetails()
        }
    }
    
    func getElectionDetails() async {
        do {
            try await Task.sleep(for: .seconds(4))
        } catch {
            // Handle cancellation if the task is cancelled while sleeping
            print("Sleep was interrupted: \(error)")
            return
        }
        
        // 2. Your actual election logic goes here
        print("MyDatabaseActor: Fetched election details successfully.")
        print(ConcurrencyContext.capture())
    }
    
}

//
//  NetworkActor.swift
//  TesterConcurrency
//
//  Created by amglobal on 10/30/26.
//

import Foundation


@globalActor
actor NetworkActor {
    public static let shared = NetworkActor()
}



@NetworkActor
class MyNetworkActor {
    
    func getElectionDetails() async {
        do {
            try await Task.sleep(for: .seconds(2))
        } catch {
            // Handle cancellation if the task is cancelled while sleeping
            print("Sleep was interrupted: \(error)")
            return
        }
        
        // 2. Your actual election logic goes here
        print("Fetched election details successfully.")
        print(ConcurrencyContext.capture())
    }
    
}

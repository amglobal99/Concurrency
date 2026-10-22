//
//  ContentView.swift
//  TesterConcurrency
//
//  Created by amglobal on 10/22/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
           
           Button(action: {
               handleButtonTap()
           }) {
               Text("Tap Me!")
                   .padding()
                   .background(Color.blue)
                   .foregroundColor(.white)
                   .cornerRadius(8)
           }
        }
        .padding()
    }
    
    
    
    
    func handleButtonTap()  {
        Task {
            // Simulate a network delay of 2 seconds
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            print ("Current thread: \(Thread.currentThread)")
        }
    }
} // ContentView





extension Thread {
    public static var currentThread: Thread {
        return Thread.current
    }
}







#Preview {
    ContentView()
}

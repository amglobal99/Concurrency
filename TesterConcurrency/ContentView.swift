//
//  ContentView.swift
//  TesterConcurrency
//
//  Created by amglobal on 10/22/26.
//

import SwiftUI

struct ContentView: View {
    
    //let util = Utilit()
    
    var body: some View {
       VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
           
           Button(action: { handleButtonTap()}) {
               Text("Call Func with Task Block")
                   .padding()
                   .background(Color.blue)
                   .foregroundColor(.white)
                   .cornerRadius(8)
           }
           
           
           Button(action: { getScores()}) {
               Text("Call Utilities")
                   .padding()
                   .background(Color.blue)
                   .foregroundColor(.white)
                   .cornerRadius(8)
                   .frame(maxWidth: .infinity)
           }
           
           
        
        } // vstack
        .padding()
    }
    
    
    
    

    func handleButtonTap()  {
        Task {
           _ =  await Utilities.performBackgroundWork()
           //  print(ConcurrencyContext.capture())
        }
    }
    
    
    

    
    func getScores()  {
        Task {
            _ = await Utilities.getGameScores()
        }
    }
    
    
    
} // ContentView










//MARK: - Preview


#Preview {
    ContentView()
}

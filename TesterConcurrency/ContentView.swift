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
            
           
           Button(action: { handleButtonTap()}) {
               Text("Call @concurrent async Func ")
                   .padding()
                   .background(Color.blue)
                   .foregroundColor(.white)
                   .cornerRadius(8)
           }
           
           
           Button(action: { handleButtonTap2()}) {
               Text("Call nonisolated async Func")
                   .padding()
                   .background(Color.blue)
                   .foregroundColor(.white)
                   .cornerRadius(8)
                   .frame(maxWidth: .infinity)
           }
           
           Spacer()
        
        } // vstack
        .padding()
    }
    
    
    
    
    /// This will call a function marked **@CONCURRENT **
    func handleButtonTap()  {
        Task {
           _ =  await Utilities.performBackgroundWork()
        }
    }
    
    
    

    /// This will call a function marked **NONISOLATED **
    func handleButtonTap2()  {
        Task {
            _ = await Utilities.getGameScores()
        }
    }
    
    
    
} // ContentView










//MARK: - Preview


#Preview {
    ContentView()
}

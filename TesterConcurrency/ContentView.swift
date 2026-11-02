//
//  ContentView.swift
//  TesterConcurrency
//
//  Created by amglobal on 10/22/26.
//

import SwiftUI

struct ContentView: View {
    
    //@State private var myActor = MyNetworkActor()
    //@State private var myDBActor = MyDatabaseActor()
    
    let myActor: MyNetworkActor
    let myDBActor: MyDatabaseActor
    
    
    
    var body: some View {
       VStack(spacing: 20) {
            
           
           Button(action: { handleButtonTap()}) {
               Text("1.  @concurrent async Func ")
                   .padding()
                   .background(Color.blue)
                   .foregroundColor(.white)
                   .cornerRadius(8)
           }
           
           
           Button(action: { handleButtonTap2()}) {
               Text("2. Main Actor")
                   .padding()
                   .background(Color.blue)
                   .foregroundColor(.white)
                   .cornerRadius(8)
                   .frame(maxWidth: .infinity)
           }
           
           
           Button(action: { handleButtonTap3()}) {
               Text("3. NETWORK Actor")
                   .padding()
                   .background(Color.blue)
                   .foregroundColor(.white)
                   .cornerRadius(8)
                   .frame(maxWidth: .infinity)
           }
           
           Button(action: { handleButtonTap4()}) {
               Text("4.NETWORK Actor")
                   .padding()
                   .background(Color.blue)
                   .foregroundColor(.white)
                   .cornerRadius(8)
                   .frame(maxWidth: .infinity)
           }
           
           Button(action: { handleButtonTap5()}) {
               Text("5. Database Actor")
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
    
    
    
    
    /// This will call a function in a Global Actor
    /// I am assuming it will run on BACKGround
    func handleButtonTap3()  {
        Task {
            _ = await myActor.performTask()
        }
    }
    
    
    func handleButtonTap4()  {
        Task {
            _ = await myActor.performTask()
        }
    }
    
    
    /// call an ASYNC function on DatabaseActor
    func handleButtonTap5()  {
        Task {
            _ = await myDBActor.performDatabaseTask()
        }
    }
    

    
} // ContentView










//MARK: - Preview


#Preview {
    ContentView(myActor: MyNetworkActor(), myDBActor: MyDatabaseActor())
}

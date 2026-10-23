//
//  Utility.swift
//  TesterConcurrency
//
//  Created by amglobal on 10/22/26.
//

import Foundation


public struct Utilities {
    
    private init() {}
    
    
   
    nonisolated public static func getGameScores() async -> String {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
       // MainActor.assertIsolated()
        print(ConcurrencyContext.capture())
        return "SwiftDeveloper_99"
    }
    
    
    // Non-isolated async functions are guaranteed to run off the MainActor
    @concurrent public static func performBackgroundWork() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
         print(" \(ConcurrencyContext.capture())")
    }
    
    
    public static func getExecutionContext() -> String {
        let isolationName = #isolation.map { String(describing: $0) } ?? "nonisolated"
        return isolationName
    }
    
  
    
    public static func logCurrentContext(message: String, callerIsolation: (any Actor)? = #isolation) {
        if let actor = callerIsolation {
            if actor === MainActor.shared {
                print("📝 Log: \(message) executed on MainActor")
            } else {
                print("📝 Log: \(message) executed inside Background Actor: \(type(of: actor))")
            }
        } else {
            print("📝 Log: \(message) executed in a non-isolated context (background thread pool)")
        }
    }
    
    
    
    
    
    
    
} // Utilities





extension Thread {
    
    nonisolated
    public static var currentThread: Thread {
        return Thread.current
    }
    
    nonisolated
    public static var isMain: Bool {
        return Thread.isMainThread
    }
    
}


//MARK: - Capture Context


 nonisolated public struct ConcurrencyContext: Sendable, CustomStringConvertible {
    
    /// The memory address or description of the current actor (if captured via TaskLocals)
    public let actorContext: String
    /// Whether the code is physically executing on the Main Thread
    public let isMainThread: Bool
    /// Description of the underlying execution queue/pool
    public let executionPool: String

    public var description: String {
        """
        [Concurrency Context]
          ├─ Actor Context:   \(actorContext)
          ├─ Main Thread:      \(isMainThread)
          └─ Execution Pool:   \(executionPool)
        """
    }

    
    /// Captures the current execution and actor context
    
    nonisolated public static func capture() -> Self {
        let isMain = Thread.isMainThread
        
        // 1. Resolve execution pool
        let pool = isMain ? "Main Queue" : "Swift Cooperative Pool (Thread: \(Thread.current))"
        
        // 2. Resolve actor context (Falls back to TaskLocal tracking if set, or detects MainActor)
        var actorDesc = "Unknown/Non-Isolated"
        if isMain {
            actorDesc = "MainActor"
        } else if let trackedActor = CurrentActorTracker.value {
            actorDesc = trackedActor
        }

        return ConcurrencyContext(
            actorContext: actorDesc,
            isMainThread: isMain,
            executionPool: pool
        )
    }
}




/// Helper to track custom actor boundaries since Swift doesn't expose
/// the current arbitrary actor instance dynamically yet.
nonisolated  public enum CurrentActorTracker {
    @TaskLocal static var value: String?
}





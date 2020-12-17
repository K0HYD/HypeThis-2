
//
//  PhoneToWatchDataController.swift
//  HypeThis2Watch Extension
//
//  Created by Dale Puckett on 12/16/20.
//

import Foundation
import WatchConnectivity

class WatchToPhoneDataController: NSObject, WCSessionDelegate, ObservableObject {

    
    static var shared = WatchToPhoneDataController()
    
    @Published var hypedEvents: [HypedEvent] = []
    
    var session = WCSession.default
    
    override init() {
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        switch activationState {
        case .activated:
            print("Activated 😮")
        default:
            print("Not able to talk to watch ☹️")
        }
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        decodeContext(context: applicationContext)
    }
    
    func decodeContext(context: [String:Any]){
        
        if let hypedData = context["hypedEvents"] as? Data {
            let decoder = JSONDecoder()
            if let hypedEventsJSON = try? decoder.decode([HypedEvent].self, from: hypedData) {
                DispatchQueue.main.async {
                    self.hypedEvents = hypedEventsJSON
                }
            }
        }
    }
}


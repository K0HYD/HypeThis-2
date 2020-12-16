//
//  PhoneToWatchDataController.swift
//  HypeThis2Watch Extension
//
//  Created by Dale Puckett on 12/16/20.
//

import Foundation
import WatchConnectivity

class PhoneToWatchDataController: NSObject, WCSessionDelegate {
    
    static var shared = PhoneToWatchDataController()
    var session: WCSession?
    
    func setupSession() {
        if WCSession.isSupported() {
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        switch activationState {
        case .activated:
            print("Activated 😮")
        default:
            print("Not able to talk to watch ☹️")
        }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("Now Inactive :(")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("Did Deactivate :(")
    }
    func sendContext(context: [String:Any]) {
        try? session?.updateApplicationContext(context)
    }
    func converHypedEventsToContext(hypedEvents: [HypedEvent]) -> [String:Any] {
        var imagelessHhypedEvents: [HypedEvent] = []
        for hypedEvent in hypedEvents {
            let imagelessHypedEvent = HypedEvent()
            imagelessHypedEvent.id = hypedEvent.id
            imagelessHypedEvent.date = hypedEvent.date
            imagelessHypedEvent.title = hypedEvent.title
            imagelessHypedEvent.color = hypedEvent.color
            imagelessHypedEvent.url = hypedEvent.url
            imagelessHhypedEvents.append(imagelessHypedEvent)
        }
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(imagelessHhypedEvents) {
            return ["hypedEvents":encoded]
        }
        return ["failed":0]
    }
}

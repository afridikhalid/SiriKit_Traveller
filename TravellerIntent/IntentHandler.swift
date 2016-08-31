//
//  IntentHandler.swift
//  TravellerIntent
//
//  Created by Khalid Afridi on 18/08/16.
//  Copyright © 2016 Jayway. All rights reserved.
//

import Intents

// we can use can
// INRequestRideIntentHandling, INGetRideStatusIntentHandling, INListRideOptionsIntent

class IntentHandler: INExtension, INRidesharingDomainHandling {
   

    
    // MARK: - INRequestRideIntentHandling
    
    // requeired (none optional)
    /// This func is the last one will be called by Siri to complete your ride booking (none optional).
    ///
    /// - parameter intent:     set intents ride status and phase to success in case it's a success.
    /// - parameter completion: send the response code activity, and rideStatus
    
    func handle(requestRide intent: INRequestRideIntent, completion: @escaping (INRequestRideIntentResponse) -> Void) {
        
        print("handle: requestRide intent")
        
        let status = RideStatus()
        let rideStatus = status.confirmRideRequest(with: intent)
        
        // I used ride Identifier as activity type so you can access it in your container app
        let activity = NSUserActivity(activityType: rideStatus.rideIdentifier!)
        
        let response = INRequestRideIntentResponse(code: .success, userActivity: activity)
        response.rideStatus = rideStatus
        
        completion(response)
        
    }
    
    // Validate that this intent is ready for the next step (optional).
    func confirm(requestRide intent: INRequestRideIntent, completion: @escaping (INRequestRideIntentResponse) -> Void) {
        
        print("confirm: requestRide intent called")
        
        // here we asume that we get the ride status corectly from server and it's a success
        let responseCode = INRequestRideIntentResponse(code: .success, userActivity: nil)
        completion(responseCode)
    }
    
    
    
    // resolve has 4 optional methods where at least 2 should be implemented to complete the booking
    // Pickup location and Drop off Location
    func resolvePickupLocation(forRequestRide intent: INRequestRideIntent, with completion: @escaping (INPlacemarkResolutionResult) -> Void) {
        
        let response: INPlacemarkResolutionResult
        
        if let pickUpLocation = intent.pickupLocation {
            response = INPlacemarkResolutionResult.success(with: pickUpLocation)
        } else {
            response = INPlacemarkResolutionResult.needsValue()
        }
        
        completion(response)
    }
    
    
    
    func resolveDropOffLocation(forRequestRide intent: INRequestRideIntent, with completion: @escaping (INPlacemarkResolutionResult) -> Void) {
        
        let response: INPlacemarkResolutionResult
        if let dropOffLocation = intent.dropOffLocation {
            response = INPlacemarkResolutionResult.success(with: dropOffLocation)
        } else {
            response = INPlacemarkResolutionResult.needsValue()
        }
        
        completion(response)
    }
    
    
    
    // Here you can provide periodical information about your ride
    // MARK: - INGetRideStatusIntent
    func handle(getRideStatus intent: INGetRideStatusIntent, completion: @escaping (INGetRideStatusIntentResponse) -> Void) {
        
        let response = INGetRideStatusIntentResponse(code: .success, userActivity: nil)
        completion(response)
        
    }
    
    func confirm(getRideStatus intent: INGetRideStatusIntent, completion: @escaping (INGetRideStatusIntentResponse) -> Void) {
        
        let response = INGetRideStatusIntentResponse(code: .success, userActivity: nil)
        completion(response)
        
    }
    
    
    func startSendingUpdates(forGetRideStatus intent: INGetRideStatusIntent, to observer: INGetRideStatusIntentResponseObserver) {
        
        print("sending update started")
    }
    
    func stopSendingUpdates(forGetRideStatus intent: INGetRideStatusIntent) {
        print("sending update stoped")
    }
    
    
    
    // MARK: - INListRideOptionsIntent
    // INList RideOptionsIntent also has 2 more optional resolver protocols for pickup and drop off
    // so you can implement those as well.
    func handle(listRideOptions intent: INListRideOptionsIntent, completion: @escaping (INListRideOptionsIntentResponse) -> Void) {
        
        let response = INListRideOptionsIntentResponse(code: .success, userActivity: nil)
        response.expirationDate = Date(timeIntervalSinceNow: 3700)
        response.rideOptions = Rides.RideOptions()
        
        completion(response)
        
    }

    
    func confirm(listRideOptions intent: INListRideOptionsIntent, completion: @escaping (INListRideOptionsIntentResponse) -> Void) {
        
        let response = INListRideOptionsIntentResponse(code: .success, userActivity: nil)
        completion(response)
    }
    
    
}


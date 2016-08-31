//
//  RideStatus.swift
//  Traveller
//
//  Created by Khalid Afridi on 18/08/16.
//  Copyright © 2016 Jayway. All rights reserved.
//

import Intents
import UIKit


class RideStatus {

    
    func confirmRideRequest(with intent: INRequestRideIntent) -> INRideStatus {
        
        let rideStatus = INRideStatus()
        rideStatus.rideIdentifier = "abc123" // some unique number coming from server
        rideStatus.pickupLocation = intent.pickupLocation
        rideStatus.dropOffLocation = intent.dropOffLocation
        rideStatus.estimatedPickupDate = Date(timeIntervalSinceNow: 370)
        
        rideStatus.vehicle = vehicle(with: intent)
        rideStatus.driver = driver()
        
        rideStatus.phase = .confirmed
        
        return rideStatus
    }
    
    
    
    
    // MARK: - Vehicle & Driver
    private func vehicle(with intent: INRequestRideIntent) -> INRideVehicle {
        
        let vehicle = INRideVehicle()
        
        // This is a fake location
        // you have to get the real location of the vehicle (live data)
        // have to do it in background
        vehicle.location = intent.dropOffLocation?.location
        
        // now is the time to change the image for the vehicle in case you want image you like
        // you can change the anontation of the make to show your vehicle but it should be INImage not UIImage
        
        // in this beta there is a bug where you can not assign any image you import into project
        // the solution is for the time being pass in your UIImage as data
        // You have to import UIKit as well to be able to do this
        
        
        let vehicleImage = #imageLiteral(resourceName: "car")
        let vehicleImageData = UIImagePNGRepresentation(vehicleImage)!
        vehicle.mapAnnotationImage = INImage(imageData: vehicleImageData)
        
        return vehicle
    }
    
    
    
    private func driver() -> INRideDriver {
        
        // all the comments in vehicle func apples here as well
        
        // this person I dentifier should is information about the User who orders the ride
        
        // so you can get their information and pass in here
        let person = INPersonHandle(value: "user@test.com", type: .emailAddress)
        
        let driverImage = #imageLiteral(resourceName: "driver")
        let driverImageData = UIImagePNGRepresentation(driverImage)!
        let image = INImage(imageData: driverImageData)
        
        let driver = INRideDriver(personHandle: person, nameComponents: nil, displayName: "Jane Doe", image: image, rating: "4.5", phoneNumber: "0758406201")

        return driver
        
    }
    
    
    
    
}

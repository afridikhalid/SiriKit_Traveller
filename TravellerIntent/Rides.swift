//
//  Rides.swift
//  Traveller
//
//  Created by Khalid Afridi on 31/08/16.
//  Copyright © 2016 Jayway. All rights reserved.
//


import Intents
import UIKit

class Rides {
    
    
    class func RideOptions() -> [INRideOption] {
        
        let mini = INRideOption(name: "Mini Cooper", estimatedPickupDate: Date(timeIntervalSinceNow: 1000))
        let audi = INRideOption(name: "Audi", estimatedPickupDate: Date(timeIntervalSinceNow: 800))
        let bmw = INRideOption(name: "BMW", estimatedPickupDate: Date(timeIntervalSinceNow: 800))
        let mb = INRideOption(name: "Mercidez Benz", estimatedPickupDate: Date(timeIntervalSinceNow: 750))
        let vw = INRideOption(name: "VW Passat", estimatedPickupDate: Date(timeIntervalSinceNow: 900))
        
        // INRideOptions has it's own properties such as INPriceRange, specialpricing and more...
        // please see INRideOptions class header for more information
        audi.disclaimerMessage = "Disclamer information about this ride"
        audi.specialPricing = "45.7x"
        
        // as of xcode beta there is a bug where you can not pass UIImage directly to INImage
        // this is a work around
        
        let specailTag = #imageLiteral(resourceName: "specail_price")
        let tagPng = UIImagePNGRepresentation(specailTag)!
        
        audi.specialPricingBadgeImage = INImage(imageData: tagPng)
        
        return [mini, audi, bmw, mb, vw]
    }
    
}

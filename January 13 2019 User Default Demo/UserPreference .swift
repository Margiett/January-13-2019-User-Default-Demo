//
//  UserPreference .swift
//  January 13 2019 User Default Demo
//
//  Created by Margiett Gil on 1/13/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation
//The UserDefaults object, formerly known as NSUserDefaults , is exceptionally useful for storing small pieces of data in your app. You use it to save your app user's settings, set some “flags”, or simply use it as a tiny data store.

enum Image: String {
    case bike = "bike"
    case run = "run"
}

enum UnitMeasurement: String {
    case miles = "Miles"
    case kilometers = "Kilometers"
}

struct UserPreferenceKey {
    static let structUnitMeasurement = "Unit Measurement"
    static let imageStruct = "Image"
}

class UserPreference {
    
    // singlton is an instance that can never be seprated again
    // a singleton's initializer Needs to be private - this ensures that only one instance of this class is used throughout the application
    private init() {}
    //MARK: what does userDefault / userPreference / userPreferenceKey mean ? ->
//MARK: Definition:
//    private let standard = UserDefaults.standard
//    static let shared = UserPreference()
    //MARK: if i want to user the code below in the function i need the two lines of code above !!!!
     //standard.set(unit.rawValue, forKey: UserPreferenceKey.unitMeasurement)
    static let shared = UserPreference()
    
    //MARK: set a user default value (object)
    func updateUnitMeasurement(with unit: UnitMeasurement) {
        //MARK: storing or persitting the unit measurement value to userDefaults (device or simimular as permanent storage)
       
        //userDefault.standard is a singleton in iOS that gives us access to saving and retrieving store data in the device or simulator
        UserDefaults.standard.set(unit.rawValue, forKey: UserPreferenceKey.structUnitMeasurement)
        
        
        // key is "Unit Measurment"
        //value is either "Miles or Kilometers"
        //UserDefaults: ["Unit Measurement: Miles"]
    }
    
    // this line is saving the rawValue of the picture to the userDefault
    func updateImage(with picture: Image) {
        UserDefaults.standard.set(picture.rawValue, forKey: UserPreferenceKey.imageStruct)
    }
    
    
    //retrieve a user defaults value (object)
    // this code is getting the userDefault information from the rawValue that was saved in updateUnitMeasurment
    func getUnitMesurement() -> UnitMeasurement? {
        guard let unitMeasurement = UserDefaults.standard.object(forKey: UserPreferenceKey.structUnitMeasurement) as? String else  {
            
            // we return nil because unitMeasurment is an optional have no value 
            return nil
        }
        return UnitMeasurement(rawValue: unitMeasurement)
    }
    
    func getImage() -> Image? {
        guard let imageGet = UserDefaults.standard.object(forKey: UserPreferenceKey.imageStruct) as? String else {
            return nil
        }
        return Image(rawValue: imageGet)
    }
    
    
    
}

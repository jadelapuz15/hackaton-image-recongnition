//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on April 15, 2021

import Foundation

class CarModel : Codable {
    
    let bodyStyle : BodyStyle?
    let carMake : CarMake?
    let colour : String?
    let descriptionField : String?
    let engine : String?
    let expiry : String?
    let extended : Extended?
    let imageUrl : String?
    let makeDescription : MakeDescription?
    let modelDescription : ModelDescription?
    let registrationYear : String?
    let state : String?
    let vechileIdentificationNumber : String?
    
    enum CodingKeys: String, CodingKey {
        case bodyStyle = "BodyStyle"
        case carMake = "CarMake"
        case colour = "Colour"
        case descriptionField = "Description"
        case engine = "Engine"
        case expiry = "Expiry"
        case extended = "extended"
        case imageUrl = "ImageUrl"
        case makeDescription = "MakeDescription"
        case modelDescription = "ModelDescription"
        case registrationYear = "RegistrationYear"
        case state = "State"
        case vechileIdentificationNumber = "VechileIdentificationNumber"
    }
}

class ModelDescription : Codable {
    
    let currentTextValue : String?
    
    enum CodingKeys: String, CodingKey {
        case currentTextValue = "CurrentTextValue"
    }
}

class Extended : Codable {
    
    let bodyDescription : String?
    let bodyType : String?
    let capacityUnit : String?
    let capacityValue : String?
    let code : String?
    let colour : String?
    let cylinders : String?
    let driveType : String?
    let engineDescription : String?
    let family : String?
    let fuelType : String?
    let make : String?
    let model : String?
    let nvic : String?
    let series : String?
    let transmissionType : String?
    let variant : String?
    let year : String?
    
    enum CodingKeys: String, CodingKey {
        case bodyDescription = "bodyDescription"
        case bodyType = "bodyType"
        case capacityUnit = "capacityUnit"
        case capacityValue = "capacityValue"
        case code = "code"
        case colour = "colour"
        case cylinders = "cylinders"
        case driveType = "driveType"
        case engineDescription = "engineDescription"
        case family = "family"
        case fuelType = "fuelType"
        case make = "make"
        case model = "model"
        case nvic = "nvic"
        case series = "series"
        case transmissionType = "transmissionType"
        case variant = "variant"
        case year = "year"
    }
}

class BodyStyle : Codable {
    
    let currentTextValue : String?
    
    enum CodingKeys: String, CodingKey {
        case currentTextValue = "CurrentTextValue"
    }

}

class CarMake : Codable {
    
    let currentTextValue : String?
    
    enum CodingKeys: String, CodingKey {
        case currentTextValue = "CurrentTextValue"
    }

}


class MakeDescription : Codable {
    
    let currentTextValue : String?
    
    enum CodingKeys: String, CodingKey {
        case currentTextValue = "CurrentTextValue"
    }

}

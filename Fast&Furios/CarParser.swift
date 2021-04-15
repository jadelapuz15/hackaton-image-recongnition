//
//  CarParser.swift
//  Fast&Furios
//
//  Created by Jade Lapuz on 4/15/21.
//

import Foundation

class Car {
    var description: String = ""
    var registrationYear: String = ""
    var carMake: String = ""
    var carModel: String = ""
    var bodyStyle: String = ""
    var jsonString: String = ""
}

class CarParser: NSObject {
    
    static let shared = CarParser()
    
    private let dictionaryKeys = ["vehicleJson", "Description", "RegistrationYear", "CarMake", "CarModel", "BodyStyle"]
    private var car: Car!
    private var currentValue: String?
    
    private override init() {
        
    }
    
    func requestCarDetails(plateNumber: String, state: String, completion: @escaping (_ car: Car?, _ error: Error?) -> ()) {
        guard let urlString = "http://www.carregistrationapi.com/api/reg.asmx/CheckAustralia?RegistrationNumber=\(plateNumber)&username=oneflare&State=\(state)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlString) else {
            let error = NSError(domain: "", code: 400, userInfo: [NSLocalizedDescriptionKey: "Invalid License plate"])
            completion(nil, error)
            return
        }
        
        print(url)
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            let stringResponse = String(decoding: data, as: UTF8.self)
            
            if stringResponse.contains("Australian Lookup failed") {
                let error = NSError(domain: url.description, code: 400, userInfo: [NSLocalizedDescriptionKey: "No information found for license plate: \(plateNumber)"])
                completion(nil, error)
            }
            
            let parser = XMLParser(data: data)
            parser.delegate = self
            DispatchQueue.main.async {
                if parser.parse() {
                    completion(self.car, nil)
                }
            }
        }
        task.resume()
    }
}

extension CarParser: XMLParserDelegate {
    
    func parserDidStartDocument(_ parser: XMLParser) {
        car = Car()
    }
    // start element
    //
    // - If we're starting a "record" create the dictionary that will hold the results
    // - If we're starting one of our dictionary keys, initialize `currentValue` (otherwise leave `nil`)
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if dictionaryKeys.contains(elementName) {
            
            self.currentValue = String()
            
        }
    }
    
    // found characters
    //
    // - If this is an element we care about, append those characters.
    // - If `currentValue` still `nil`, then do nothing.
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        self.currentValue? += string
        
    }
    
    // end element
    //
    // - If we're at the end of the whole dictionary, then save that dictionary in our array
    // - If we're at the end of an element that belongs in the dictionary, then save that value in the dictionary
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if dictionaryKeys.contains(elementName) {
            
            switch elementName {
            case "vehicleJson":
                car.jsonString = (currentValue ?? "")
            case "Description":
                car.description = (currentValue ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
            case "RegistrationYear":
                car.registrationYear = (currentValue ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
            case "CarMake":
                car.carMake = (currentValue ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
            case "CarModel":
                car.carModel = (currentValue ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
            case "BodyStyle":
                car.bodyStyle = (currentValue ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
            default:
                return
            }
            
            self.currentValue = nil
        }
        
    }
    
    // Just in case, if there's an error, report it. (We don't want to fly blind here.)
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError)
        
        self.currentValue = nil
    }
}

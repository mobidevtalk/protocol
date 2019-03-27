//: [Index](Index)

import Foundation

protocol Cape{
    var capeColor: String { get }
}

class SuperHero{
    let name: String
    let originalName: String
    
    init(name: String, originalName: String, capeColor: String) {
        self.name = name
        self.originalName = originalName
    }
    
    func speciality() -> String{
        return ""
    }
    
    var profile: String?{
        return "Known as: \(name) \n Original Name: \(originalName).\n Speciality is: \n\(speciality())"
    }
}


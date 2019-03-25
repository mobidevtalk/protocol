//: [Index](Index)

import Foundation

class SuperHero{
    let name: String
    let originalName: String
    let capeColor: String
    
    init(name: String, originalName: String, capeColor: String) {
        self.name = name
        self.originalName = originalName
        self.capeColor = capeColor
    }
    
    func speciality() -> String{
        return ""
    }
    
    var profile: String?{
        return "Known as: \(name) \n Original Name: \(originalName) \n Wears a \(capeColor) colored Cape.\n Speciality is: \n\(speciality())"
    }
}

class Batman: SuperHero{
    init() {
        super.init(name: "Batman", originalName: "Bruce Wayne", capeColor: "Black")
    }
    
    override func speciality() -> String {
        return "Very techie and extremely cool 😎"
    }
}

class WonderWoman: SuperHero{
    init() {
        super.init(name: "Wonder Woman", originalName: "Diana", capeColor: "Red")
    }
    
    override func speciality() -> String {
        return "Come on, she is a Demigoddess"
    }
}

Batman().profile
WonderWoman().profile

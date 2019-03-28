//: [Index](Index)

import Foundation

/*:
 Composition
 */

protocol Cape{
    var capeColor: String { get }
}

class SuperHero{
    let name: String
    let originalName: String
    
    init(name: String, originalName: String) {
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

/*:
 Batman 🦇
 */
class Batman: SuperHero{
    init() {
        super.init(name: "Batman", originalName: "Bruce Wayne")
    }
    
    override func speciality() -> String {
        return "Very techie and extremely cool 😎"
    }
}

extension Batman: Cape{
    var capeColor: String { return "Black" }
}

let batman = Batman()
batman.profile
batman.capeColor

/*:
 WonderWoman
 */
class WonderWoman: SuperHero{
    init() {
        super.init(name: "Wonder Woman", originalName: "Diana")
    }
    
    override func speciality() -> String {
        return "Come on, she is a Demigoddess"
    }
}

extension WonderWoman: Cape{
    var capeColor: String { return "Red" }
}

let wonderWoman = WonderWoman()
wonderWoman.profile
wonderWoman.capeColor

/*:
 The Flash 🏃‍♂️
 */
class TheFlash: SuperHero{
    init() {
        super.init(name: "The Flash", originalName: "Barry Allen")
    }
    
    override func speciality() -> String {
        return "Runs so so fast"
    }
}

TheFlash().profile

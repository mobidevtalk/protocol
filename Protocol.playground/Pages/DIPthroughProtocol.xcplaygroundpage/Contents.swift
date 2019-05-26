//: [Index](Index)

import Foundation

struct SimpleCharacter{
    let name = "Jon"
    let power = "Have no specific power"
}

struct Info{
    func printInfo(character: SimpleCharacter) -> String {
        return "Name: " + character.name + " Power: " + character.power
    }
}

let info = Info()
info.printInfo(character: SimpleCharacter())


struct BasicInfo{
    enum Gender: String {
        case Male
        case Female
    }
    
    let fullName: String
    let gender: Gender
}

enum Species{
    case God
    case Mutated
    case Human
}

protocol Profilable{
    var infos: BasicInfo { get }
    var Species: Species { get }
    
    func remarks() -> String
}

// MARK: - DC comics
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
        return "Known as: \(name) \n Original Name: \(originalName) \n Wears a \(capeColor) colored Cape.\n Speciality is: \(speciality())"
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

extension Batman: Profilable{
    var infos: BasicInfo {
        return BasicInfo(fullName: "\(originalName) aka: \(name)", gender: .Male)
    }
    
    var Species: Species {
        return .Human
    }
    
    func remarks() -> String {
        return profile ?? speciality()
    }
}

extension WonderWoman: Profilable{
    var infos: BasicInfo {
        return BasicInfo(fullName: "\(originalName) aka: \(name)", gender: .Female)
    }
    
    var Species: Species {
        return .God
    }
    
    func remarks() -> String {
        return "Zeus daughter. \(profile ?? speciality())"
    }
}

/*:
 Marvel
 */
protocol Avenger{
    var name: String {get}
    var speciality: String {get}
}

struct IronMan: Avenger{
    var name = "Iron Man"
    var speciality = "Iron Man got the coolest gadgets. Techie and smart 😎"
}

struct CaptainAmerica: Avenger{
    var name = "Captain America"
    var speciality = "Super Human power. Quick to heal, tough to beat. 💪"
}

struct Hulk: Avenger{
    var name = "Hulk"
    var speciality = "God like power. Good at smashing  🔥"
}

struct Thor: Avenger{
    var name = "Thor"
    var speciality = "God of Thunder ⚡️"
}

extension IronMan: Profilable{
    var infos: BasicInfo {
        return BasicInfo(fullName: "Tony Stark aka: \(name)", gender: .Male)
    }
    
    var Species: Species {
        return .Human
    }
    
    func remarks() -> String {
        return "Founding member of Avengers. \(speciality)"
    }
}

extension CaptainAmerica: Profilable{
    var infos: BasicInfo {
        return BasicInfo(fullName: " Steve Rogers aka: \(name)", gender: .Male)
    }
    
    var Species: Species {
        return .Mutated
    }
    
    func remarks() -> String {
        return "True born leder. \(speciality)"
    }
}

extension Hulk: Profilable{
    var infos: BasicInfo {
        return BasicInfo(fullName: "Bruce Banner aka: \(name)", gender: .Male)
    }
    
    var Species: Species {
        return .Mutated
    }
    
    func remarks() -> String {
        return speciality
    }
}

extension Thor: Profilable{
    var infos: BasicInfo {
        return BasicInfo(fullName: "Thor Odinson aka: \(name)", gender: .Male)
    }
    
    var Species: Species {
        return .God
    }
    
    func remarks() -> String {
        return speciality
    }
}

struct ProfileScene{
    let justiceLeague: [Profilable] = [Batman(), WonderWoman()]
    let avengers: [Profilable] = [IronMan(), CaptainAmerica(), Hulk(), Thor()]
    
    func profileListing() -> String{
        let justiceLeagueProfile =  justiceLeague.reduce(into: "Justice League:\n") { (initial, profilable) in
            initial += "\nFull name: \(profilable.infos.fullName) \nGender: \(profilable.infos.gender) \nRemarks: \(profilable.remarks())\n"
        }
        
        let avengersProfile =  avengers.reduce(into: "Avengers:\n") { (initial, profilable) in
            initial += "\nFull name: \(profilable.infos.fullName) \nGender: \(profilable.infos.gender) \nRemarks: \(profilable.remarks())\n"
        }
        
        return justiceLeagueProfile + "\n\n" + avengersProfile
    }
}

print(ProfileScene().profileListing())

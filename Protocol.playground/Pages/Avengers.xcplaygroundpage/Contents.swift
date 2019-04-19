//: [Index](Index)

import Foundation

/*:
 A case study of Avengers
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

let initialTeam: [Avenger] = [IronMan(), CaptainAmerica(), Hulk(), Thor()]
initialTeam.forEach({ print($0.name) })

initialTeam.forEach({print($0.name + ": " + $0.speciality)})

/*:
 Facilitating as needed
 */
protocol Defense: Avenger{
    var defenseSystem: String { get }
}

extension IronMan: Defense{
    var defenseSystem: String{
        get{
            return "The suite itself contains the defensive counter measure"
        }
    }
}

extension CaptainAmerica: Defense{
    var defenseSystem: String{
        get{
            return "The shield is the main defense"
        }
    }
}

extension Thor: Defense{
    var defenseSystem: String{
        get{
            return "The spinning Hammer is the defense"
        }
    }
}

let defenseHolder = initialTeam.compactMap { (avenger) -> Defense? in
    if let defense = avenger as? Defense{
        return defense
    }
    return nil
}
defenseHolder.forEach({ print($0.name + "'s Defense system is: " + $0.defenseSystem) })


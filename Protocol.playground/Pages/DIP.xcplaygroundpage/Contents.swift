//: [Index](Index)

import Foundation

/*:
 Compile time dependency
 */

class Team{
    func introduction(){fatalError("Subclass should implement")}
}

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

class TeamAvenger: Team{
    private let initialTeam: [Avenger] = [IronMan(), CaptainAmerica(), Hulk(), Thor()]
    
    override func introduction() {
        initialTeam.forEach({print($0.name + ": " + $0.speciality)})
    }
}


let team = TeamAvenger()
team.introduction()



enum Position: String{
    case Ground
    case Top
    case Air
    case Jump
}

enum Action: String{
    case Punch
}

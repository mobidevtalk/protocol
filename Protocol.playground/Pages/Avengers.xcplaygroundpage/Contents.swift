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
    var speciality = "God like power. Good at smashing 🔥"
}

struct Thor: Avenger{
    var name = "Thor"
    var speciality = "God of Thunder ⚡️"
}

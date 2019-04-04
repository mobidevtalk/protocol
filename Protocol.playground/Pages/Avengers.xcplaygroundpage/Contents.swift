//: [Index](Index)

import Foundation

/*:
 A case study of Avengers
 */

protocol Avenger{
    var name: String {get}
}

struct IronMan: Avenger{
    var name = "Iron Man"
}

struct CaptainAmerica: Avenger{
    var name = "Captain America"
}

struct Hulk: Avenger{
    var name = "Hulk"
}

struct Thor: Avenger{
    var name = "Thor"
}

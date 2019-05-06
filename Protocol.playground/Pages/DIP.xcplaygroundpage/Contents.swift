//: [Index](Index)

import Foundation

/*:
 Compile time dependency
 */

class Team{
    func introduction(){fatalError("Subclass should implement")}
}

/*:
 Run time dependency
 */

/*:
 The definition of Avergers is available on the DIP/Sources/AvengersLib.swift
 */
class TeamAvenger: Team{
    private let initialTeam: [Avenger]
    
    private let ironMan: IronMan
    private let captainAmerica: CaptainAmerica
    private let hulk: Hulk
    private let thor: Thor
    
    override init() {
        ironMan = IronMan()
        captainAmerica = CaptainAmerica()
        hulk = Hulk()
        thor = Thor()
         
        initialTeam = [ironMan, captainAmerica, hulk, thor]
    }
    
    override func introduction() {
        initialTeam.forEach({print($0.name + ": " + $0.speciality)})
    }
}

let team = TeamAvenger()
team.introduction()


/*:
 Source code dependency
 */
class SimpleAvenger: Team{
    private let initialTeam: [Avenger]
    
    override init() {
        initialTeam = [IronMan(), CaptainAmerica(), Hulk(), Thor()]
    }
    
    override func introduction() {
        initialTeam.forEach({print($0.name + ": " + $0.speciality)})
    }
}

let simpleTeam = SimpleAvenger()
simpleTeam.introduction()




enum Position: String{
    case Ground
    case Top
    case Air
    case Jump
}

enum Action: String{
    case Punch
}

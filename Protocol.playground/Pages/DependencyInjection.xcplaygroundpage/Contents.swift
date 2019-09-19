//: [Index](Index)

/*:
 [Swift Protocol Hub](https://mobidevtalk.com/swift-protocol-hub/)
 
 [Dependency Injection in Swift](https://mobidevtalk.com/swift-dependency-injection-through-protocol/)
 */

struct SuperHero{
    var superPower: String?
}

var hero = SuperHero()
hero.superPower = "N/A"

SuperHero(superPower: "Speed")


//: Protocol usage on Dependency Injection

enum Scale: String{
    case noob = "Below basic"
    case basic = "Basic"
    case intermediate = "Skillful"
    case advance = "Very Skillful"
    case superAdvance = "Super Skillful"
}

enum Capability: CustomStringConvertible{
    case strength(Scale)
    case speed(Scale)
    case fly(Scale)
    
    var description: String{
        switch self {
        case .strength(let scale):
            return "\(scale.rawValue) level of Strength"
        case .speed(let scale):
            return "\(scale.rawValue) level of Speed"
        case .fly(let scale):
            return "\(scale.rawValue) level of Flying"
        }
    }
}

protocol Recruiter{
    func submitInfo(name: String, superHeroName: String, capabilities: [Capability])
    func formattedInfo() -> String?
}

struct IronMan{
    private let name = "Tony Stark"
    private let aka = "Iron Man"
    private let capabilities: [Capability] = [.strength(.advance), .fly(.superAdvance)]
    
    let recruiter: Recruiter
    
    func submitResume(){
        recruiter.submitInfo(name: name, superHeroName: aka, capabilities: capabilities)
    }
    
    func resume() -> String{
        return recruiter.formattedInfo() ?? ""
    }
}

class Agent: Recruiter{
    private var resume: String?
    
    func submitInfo(name: String, superHeroName: String, capabilities: [Capability]) {
        let capabilityString = capabilities.reduce(into: "Capabilities includes:", { $0 += " " + $1.description + "," })
        resume = "Name: \(name)\nAKA: \(superHeroName)\n\(capabilityString)"
    }
    
    func formattedInfo() -> String? {
        return resume
    }
}

let ironManThroughAgent = IronMan(recruiter : Agent())
ironManThroughAgent.submitResume()
print(ironManThroughAgent.resume())

class Agency: Recruiter{
    private var resume: String?
    
    func submitInfo(name: String, superHeroName: String, capabilities: [Capability]) {
        let splittedName = name.split(separator: " ")

        let fullName = "First name: " + (splittedName.first ?? "") + (splittedName.count > 1 ? "\(splittedName.dropFirst(1).reduce(into: "\nLast name", { $0 += " " + $1 }))" : "")
        
        let capabilityString = capabilities.reduce(into: "Capabilities:", { $0 += "\n" + $1.description })
        
        resume = "Commonly Know as: \(superHeroName)\n\(fullName)\n\(capabilityString)"
    }
    
    func formattedInfo() -> String? {
        return resume
    }
}

print("\n")

let ironManThroughAgency = IronMan(recruiter : Agency())
ironManThroughAgency.submitResume()
print(ironManThroughAgency.resume())

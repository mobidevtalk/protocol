//: [Index](Index)

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
    case intermediate = "Skillfull"
    case advance = "Very skilfull"
    case superAdvance = "Super Skillfull"
}

enum Capability: CustomStringConvertible{
    case streanth(Scale)
    case speed(Scale)
    case fly(Scale)
    
    var description: String{
        switch self {
        case .streanth(let scale):
            return "\(scale.rawValue) level of Streanth"
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
    private let capabilities: [Capability] = [.streanth(.advance), .fly(.superAdvance)]
    
    let recruiter: Recruiter
    
    func submitResume(){
        recruiter.submitInfo(name: name, superHeroName: aka, capabilities: capabilities)
    }
    
    func resume(){
        print(recruiter.formattedInfo() ?? "")
    }
}

class Agent: Recruiter{
    private var resume: String?
    
    func submitInfo(name: String, superHeroName: String, capabilities: [Capability]) {
        let capabilityString = capabilities.reduce(into: "Capabilities:", { $0 = "\n" + $1.description })
        resume = "Name: \(name)\nAKA: \(superHeroName)\n\(capabilityString)"
    }
    
    func formattedInfo() -> String? {
        return resume
    }
}


class Agency: Recruiter{
    private var resume: String?
    
    func submitInfo(name: String, superHeroName: String, capabilities: [Capability]) {
        let splitedName = name.split(separator: " ")

        let fullName = "First name: " + (splitedName.first ?? "") + (splitedName.count > 1 ? "\(splitedName.dropFirst(1).reduce(into: "\nLast name", { $0 += " " + $1 }))" : "")
        
        let capabilityString = capabilities.reduce(into: "\nCapabilities:", { $0 += "\n" + $1.description })
        
        resume = "Commonly Know as: \(superHeroName)\n\(fullName)\n\(capabilityString)"
    }
    
    func formattedInfo() -> String? {
        return resume
    }
}

let agency = Agency()

let ironMan = IronMan(recruiter : agency)
ironMan.submitResume()
ironMan.resume()

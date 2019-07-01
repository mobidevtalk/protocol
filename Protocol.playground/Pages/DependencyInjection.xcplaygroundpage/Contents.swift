//: [Index](Index)

struct SuperHero{
    var superPower: String?
}

var hero = SuperHero()
hero.superPower = "N/A"

SuperHero(superPower: "Speed")



enum Scale: CustomStringConvertible{
    case noob
    case basic
    case intermediate
    case advance
    case superAdvance
    
    var description: String{
        switch self {
        case .noob:
            return "Below basic"
        case .basic:
            return "Basic"
        case .intermediate:
            return "Skillfull"
        case .advance:
            return "Very skilfull"
        case .superAdvance:
            return "Super Skillfull"
        }
    }
}

enum Capability: CustomStringConvertible{
    case streanth(Scale)
    case speed(Scale)
    case fly(Scale)
    
    var description: String{
        switch self {
        case .streanth(let scale):
            return "\(scale) level of Streanth)"
        case .speed(let scale):
            return "\(scale) level of Speed"
        case .fly(let scale):
            return "\(scale) level of Flying"
        }
    }
}


protocol Avenger{
    var name: String {get}
    var capability: [Capability] {get}
    func resume() -> String
}

protocol Broadcast{
    var info: String {get}
}

struct IronMan: Avenger{
    private var broadcast: Broadcast
    
    var name = "Iron Man"
    var capability: [Capability]{
        return [.streanth(.advance), .fly(.superAdvance)]
    }
    
    func resume() -> String {
        let capabilityString = capability.reduce(into: "Capabilities:", { $0 = "\n" + $1.description })
        return "Name: \(name)\n\(capabilityString)"
    }
}



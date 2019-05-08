public protocol Avenger{
    var name: String {get}
    var speciality: String {get}
}

public struct IronMan: Avenger{
    public var name = "Iron Man"
    public var speciality = "Iron Man got the coolest gadgets. Techie and smart 😎"
    
    public init(){}
}

public struct CaptainAmerica: Avenger{
    public var name = "Captain America"
    public var speciality = "Super Human power. Quick to heal, tough to beat. 💪"
    
    public init(){}
}

public struct Hulk: Avenger{
    public var name = "Hulk"
    public var speciality = "God like power. Good at smashing  🔥"
    
    public init(){}
}

public struct Thor: Avenger{
    public var name = "Thor"
    public var speciality = "God of Thunder ⚡️"
    
    public init(){}
}

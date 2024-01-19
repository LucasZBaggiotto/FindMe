import SwiftUI



public struct Lugar: Decodable , Hashable {
    
    public var id: UUID = UUID()
    public var nome: String
    public var lat: Double
    public var long: Double
    public var categoria: String
    public var hasCheck: Bool
    
    enum CodingKeys: String, CodingKey{
        case nome
        case lat
        case long
        case categoria
        case hasCheck
        
    }
    
    public init(nome: String, lat: Double, long: Double, categoria: String, hasCheck: Bool){
        self.nome = nome
        self.lat = lat
        self.long = long
        self.categoria = categoria
        self.hasCheck = hasCheck
    }
    public init(from decoder: Decoder) throws {
        //      linha mais importante 👇🏻
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // .self puxa a classe e nao um objeto da classe
        self.nome = try container.decode(String.self, forKey: .nome)
        self.lat = try container.decode(Double.self, forKey: .lat)
        self.long = try container.decode(Double.self, forKey: .long)
        self.categoria = try container.decode(String.self, forKey: .categoria)
        self.hasCheck = try container.decode(Bool.self, forKey: .hasCheck)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)
        try values.encode(nome, forKey: .nome)
        try values.encode(categoria, forKey: .categoria)
        try values.encode(lat, forKey: .lat)
        try values.encode(long, forKey: .long)
        try values.encode(hasCheck, forKey: .hasCheck)
    }
        
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        
        
    }
    
    


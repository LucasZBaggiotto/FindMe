import SwiftUI

class RandomPicker: ObservableObject {
    @Published var randomPlace: Lugar?
    
    var barMoela: Lugar = Lugar(nome: "Bar Moela", lat: -23.5411907, long: -46.6619762, categoria: "Bar", hasCheck: false)
    var sujinho: Lugar = Lugar(nome: "Sujinho", lat: -23.553124, long: -46.6627322, categoria: "Restaurante", hasCheck: false)
    var instTomieOhtake: Lugar = Lugar(nome: "Instituto Tomie Ohtake", lat: -23.5611812, long: -46.6969364, categoria: "Museu", hasCheck: false)
    var voidPinheiros: Lugar = Lugar(nome: "Void Pinheiros", lat:   -23.5664657, long: -46.6974095, categoria: "Bar", hasCheck: false)
    var patties: Lugar = Lugar(nome: "Patties - Pinheiros", lat: -23.565384, long: -46.6854269, categoria: "Restaurante", hasCheck: false)
    var xepa: Lugar = Lugar(nome: "XEPA", lat: -23.5417171, long: -46.6556188, categoria: "Restaurante", hasCheck: false)
    var studiosCoffee: Lugar = Lugar(nome: "Studios Coffee", lat: -23.5581925, long: -46.6830672, categoria: "Cafeteria", hasCheck: false)
    var fabrique: Lugar = Lugar(nome: "Fabrique Pão e Café", lat: -23.5581911, long:-46.7011401, categoria: "Cafeteria", hasCheck: false)

    
    var locais: [Lugar] = []
    
    init() {
        self.locais = [self.barMoela, self.sujinho, self.instTomieOhtake, self.voidPinheiros, self.patties, self.xepa, self.studiosCoffee, self.fabrique  ]
        
        self.randomPlace = locais.randomElement()!
    }
    
    func randomizarLocais() {
        self.randomPlace = locais.randomElement()!
    }
}


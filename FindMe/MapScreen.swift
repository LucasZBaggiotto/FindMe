import SwiftUI
import MapKit



struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapScreen: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -23.5411907, longitude: -46.6619762), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    
    @EnvironmentObject var randomPicker: RandomPicker
    
    var body: some View {
        
        
        ZStack {
            Rectangle().strokeBorder(.white, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Map(coordinateRegion: $mapRegion, annotationItems: [Location(name: randomPicker.randomPlace?.nome ?? "Sem nome", coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(floatLiteral: randomPicker.randomPlace?.lat ?? -23.5411907), longitude: CLLocationDegrees(floatLiteral: randomPicker.randomPlace?.long ?? -46.6619762)))]) {
                location in
                MapAnnotation(coordinate: location.coordinate) {
                    VStack {
                       Image("Pin2")
                            .resizable()
                            .frame(maxWidth: 19, maxHeight: 29)
                        
                        Text(location.name)
                    }
                }
            }
            .padding(2)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .padding(20)
        .padding([.bottom], 60)
        .onAppear(perform: {
            randomPicker.randomizarLocais()
            mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(floatLiteral: randomPicker.randomPlace?.lat ?? -23.5411907), longitude: CLLocationDegrees(floatLiteral: randomPicker.randomPlace?.long ?? -46.6619762)), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        })
        
        
    }
}

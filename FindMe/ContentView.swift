import SwiftUI
import MapKit


struct ContentView: View {
    
    @EnvironmentObject var randomPicker: RandomPicker
    
    var body: some View {
        
                
        TabView{
           
           
            Home()
                .environmentObject(randomPicker)
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
           
            BucketList()
                .tabItem {
                    Label("Bucketlist", systemImage: "list.clipboard.fill")
                }
            
            Roteiros()
                .tabItem{
                    Label("Roteiros", systemImage: "checklist.checked")
                    
                }
            
        }
        
        .onAppear() {
            UITabBar.appearance().backgroundColor = .systemBackground
        }
        .tint(.primary)
    }
}

struct ContentViewPreview: PreviewProvider {
    static let randomPicker = RandomPicker()
    static var previews: some View {
        ContentView()
            .environmentObject(randomPicker)
    }
}

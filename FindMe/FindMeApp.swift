import SwiftUI

@main
struct FindMeApp: App {
    @StateObject var randomPicker = RandomPicker()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(randomPicker)
        }
    }
}

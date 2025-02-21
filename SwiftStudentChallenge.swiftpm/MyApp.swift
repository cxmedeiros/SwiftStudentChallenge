import SwiftUI

@main
struct MyApp: App {
    init() {
           SoundManager.shared.playBackgroundMusic(soundName: "relaxing-light-background-loop-ver")
       }
    var body: some Scene {
        WindowGroup {
            MenuView()
        }
    }
}

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    
    var body: some View {
        
        ZStack {
            if isActive {
                MenuView()
            } else {
                ZStack {
                    SplashScreen()
                }
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

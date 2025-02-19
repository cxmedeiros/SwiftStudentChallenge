import SwiftUI

struct HomeView: View {
    
    @State private var isNavigating = false
    @State private var isNavigating2 = false
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color("menu")
                    .ignoresSafeArea()
                
                VStack(spacing: 0){

                
                    ZStack {
                        Image("Name")
                            .padding(.trailing,50)
                        OpenCloseEye()
                            .padding(.leading, 180)
                            .padding(.top, 140)
                    }
                            
                    HStack(spacing: 100){
                        Image("ColorBlindnessTest")
                        Image("EyePhoto")
                        Image("VisionProblemTest")
                    }
                    VStack(spacing: 50){
                        HStack (alignment: .bottom){
                            Image("OphthalmologistChair")
                                .resizable()
                                .scaledToFit()
                                .frame(width:382, height:423)
                            Image("Desk")
                                .resizable()
                                .scaledToFit()
                        }
                        
                        VStack (spacing: 23.51) {
                            Button(action: {
                                SoundManager.shared.playEffect(soundName: "button-click-1")
                                isNavigating = true }) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 284, height: 67)
                                        .foregroundColor(Color(.button))
                                        .cornerRadius(12.89)
                                        .shadow(radius: 5)
                                    Text("Start")
                                        .font(.system(size: 38, weight: .regular))
                                        .foregroundColor(.white)
                                    
                                }
                            }
                            .navigationDestination(isPresented: $isNavigating) {
                                CharacterView()
                            }

                            Button(action: {
                                SoundManager.shared.playEffect(soundName: "button-click-1")
                                isNavigating2 = true}) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 284, height: 67)
                                        .foregroundColor(Color(.button))
                                        .cornerRadius(12.89)
                                        .shadow(radius: 5)
                                    Text("Credits")
                                        .font(.system(size: 38, weight: .regular, design: .default))
                                        .foregroundColor(.white)
                                }
                            }
                            .navigationDestination(isPresented: $isNavigating2) {
                                CreditsView()
                            }
                        }
                    }
                }
                .padding(.bottom, 100)
            }
        }
//        .onAppear {
//            soundManager?.play(loop: true)
//        }
    }
}

#Preview {
    HomeView()
}


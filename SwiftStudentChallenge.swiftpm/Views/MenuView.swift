import SwiftUI

struct MenuView: View {
    
    @State private var isNavigating = false
    @State private var isNavigating2 = false
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color("menu")
                    .ignoresSafeArea()
                
                VStack(spacing: 0){

                    VStack(spacing: -60) {
                        Image("New")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 208, height: 132)
                            .padding(.trailing, 400)
                        HStack {
                            Text("Visi")
                                .font(.custom(MyCustomFonts.textFont.fontName, size: 135))
                                .foregroundStyle(Color("button"))
                            OpenCloseEye()
                                .padding(.bottom, 30)
                            Text("n")
                                .font(.custom(MyCustomFonts.textFont.fontName, size: 135))
                                .foregroundStyle(Color("button"))
                        }
                    }
                    .padding(.top, 60)

                            
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
                                        .foregroundColor(Color("button"))
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
                                        .foregroundColor(Color("button"))
                                        .cornerRadius(12.89)
                                        .shadow(radius: 5)
                                    Text("Credits")
                                        .font(.system(size: 38, weight: .regular))
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
        .navigationBarBackButtonHidden(true)
    }
}


import SwiftUI

struct HomeView: View {
    
    @State private var gluten: Font?
    @State private var isNavigating = false
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
                                isNavigating = true }) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 323, height: 67)
                                        .foregroundColor(Color(.button))
                                        .cornerRadius(12.89)
                                        .shadow(radius: 5)
                                    Text("Start")
                                        .font(.system(size: 41.25, weight: .regular))
                                        .foregroundColor(.white)
                                    
                                }
                            }
                            .navigationDestination(isPresented: $isNavigating) {
                                    MilaView()
                            }

                            Button(action: {}) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 323, height: 67)
                                        .foregroundColor(Color(.button))
                                        .cornerRadius(12.89)
                                        .shadow(radius: 5)
                                    Text("Credits")
                                        .font(.system(size: 41.25, weight: .regular, design: .default))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                }
                .padding(.bottom, 100)
            }
        }
    }
}


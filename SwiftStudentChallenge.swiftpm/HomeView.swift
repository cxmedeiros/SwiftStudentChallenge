import SwiftUI

struct HomeView: View {
    
    @State private var gluten: Font?
    @State private var isNavigating = false
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                Color(.menu)
                    .ignoresSafeArea()
                
                VStack(spacing: 0){
                    
                    VStack(alignment: .leading, spacing: 0){
                        
                        HStack(alignment: .bottom){
                            Text("New")
                            //.font(gluten)
                                .foregroundStyle(Color(.button))
                            //                            .onAppear {
                            //                                   for family in UIFont.familyNames {
                            //                                       print(family) // Exibe no console do Xcode
                            //                                   }
                            //                               }
                            //OpenCloseEye()
                            Arrow()
                        }
                        
                        Text("Vision")
                        //.font(gluten)
                            .foregroundStyle(Color(.button))
                    }
                    //                .task {
                    //                    getFont()
                    //                }
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
                            //.frame(width:510, height: 397)
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
            }
        }
    }
//    
//    func getFont() {
//        let cfURL = Bundle.main.url(forResource: "Gluten-Regula", withExtension: "ttf")! as CFURL
//        
//        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
//        
//        let uiFont = UIFont(name: "Gluten-Regular.ttf", size:  30.0)
//        
//        gluten = Font(uiFont ?? UIFont())
//
//    }
}


//import SwiftUI
//
//struct DifferentsVisionsView: View {
//    
//    @State private var isNavigating = false
//    
//    var body: some View {
//        NavigationStack {
//            
//            ZStack {
//                
//                Color("menu")
//                    .ignoresSafeArea()
//                
//                VStack(spacing: 100){
//                    
//                    Text("How Each Person Sees the World")
//                        .font(.system(size: 40, weight: .medium))
//                        .foregroundStyle(Color("button"))
//                    
//                    ZStack {
//                        
//                        VStack {
//                            HStack {
//                                Image("Star1")
//                                Spacer()
//                            }
//
//                            HStack {
//                                Spacer()
//                                Image("Star1")
//                                
//                            }
//                        }
//                        .frame(width: 800, height: 107)
//                        
//                        HStack{
//                            Button(action: {
//                                SoundManager.shared.playEffect(soundName: "button-click-1")
//                            }) {
//                                ZStack {
//                                    Rectangle()
//                                        .frame(width: 180, height: 107)
//                                        .foregroundColor(Color("button2"))
//                                        .cornerRadius(12.89)
//                                        .shadow(radius: 5)
//                                    Text("Correct \n Vision")
//                                        .font(.system(size: 30, weight: .regular))
//                                        .foregroundColor(.white)
//                                }
//                            }
//                            Button(action: {
//                                SoundManager.shared.playEffect(soundName: "button-click-1")
//                            }) {
//                                ZStack {
//                                    Rectangle()
//                                        .frame(width: 180, height: 107)
//                                        .foregroundColor(Color("button2"))
//                                        .cornerRadius(12.89)
//                                        .shadow(radius: 5)
//                                    Text("Myopia")
//                                        .font(.system(size: 30, weight: .regular))
//                                        .foregroundColor(.white)
//                                }
//                            }
//                            Button(action: {
//                                SoundManager.shared.playEffect(soundName: "button-click-1")
//                            }) {
//                                ZStack {
//                                    Rectangle()
//                                        .frame(width: 180, height: 107)
//                                        .foregroundColor(Color("button2"))
//                                        .cornerRadius(12.89)
//                                        .shadow(radius: 5)
//                                    Text("Hyperopia")
//                                        .font(.system(size: 30, weight: .regular))
//                                        .foregroundColor(.white)
//                                }
//                            }
//                            Button(action: {
//                                SoundManager.shared.playEffect(soundName: "button-click-1")
//                            }) {
//                                ZStack {
//                                    Rectangle()
//                                        .frame(width: 180, height: 107)
//                                        .foregroundColor(Color("button2"))
//                                        .cornerRadius(12.89)
//                                        .shadow(radius: 5)
//                                    Text("Astigmatism")
//                                        .font(.system(size: 30, weight: .regular))
//                                        .foregroundColor(.white)
//                                }
//                            }
//                        }
//                        
//                    }
//                    
//                    Image("ScenarioCorrectVision")
//                        .resizable()
//                        .scaledToFit()
//                    Button(action: {
//                        SoundManager.shared.playEffect(soundName: "button-click-1")
//                    }) {
//                        ZStack {
//                            Rectangle()
//                                .frame(width: 284, height: 67)
//                                .foregroundColor(Color(.button))
//                                .cornerRadius(12.89)
//                                .shadow(radius: 5)
//                            Text("Next")
//                                .font(.system(size: 38, weight: .regular, design: .default))
//                                .foregroundColor(.white)
//                        }
//                    }
//                }
//            }
//        }
//        .navigationBarBackButtonHidden(true)
//    }
//}

import SwiftUI

struct DifferentsVisionsView: View {
    
    enum VisionType: String {
        case correct = "ScenarioCorrectVision"
        case myopia = "ScenarioMyopia"
        case hyperopia = "ScenarioHyperopia"
        case astigmatism = "ScenarioAstigmatism"
    }
    
    @State private var selectedVision: VisionType = .correct
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("menu")
                    .ignoresSafeArea()
                
                VStack(spacing: 100){
                    Spacer()
                    Text("How Each Person Sees the World")
                        .font(.system(size: 40, weight: .medium))
                        .foregroundStyle(Color("button"))
                    
                    ZStack {
                        VStack {
                            HStack {
                                Image("Star1")
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Image("Star1")
                            }
                        }
                        .frame(width: 800, height: 107)
                        
                        HStack {
                            VisionButton(title: "Correct \n Vision", type: .correct, selectedVision: $selectedVision)
                            VisionButton(title: "Myopia", type: .myopia, selectedVision: $selectedVision)
                            VisionButton(title: "Hyperopia", type: .hyperopia, selectedVision: $selectedVision)
                            VisionButton(title: "Astigmatism", type: .astigmatism, selectedVision: $selectedVision)
                        }
                    }
                    
                    Image(selectedVision.rawValue)
                        .resizable()
                        .scaledToFit()
                    
                    Button(action: {
                        SoundManager.shared.playEffect(soundName: "button-click-1")
                    }) {
                        ZStack {
                            Rectangle()
                                .frame(width: 284, height: 67)
                                .foregroundColor(Color("button"))
                                .cornerRadius(12.89)
                                .shadow(radius: 5)
                            Text("Next")
                                .font(.system(size: 38, weight: .regular))
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct VisionButton: View {
    let title: String
    let type: DifferentsVisionsView.VisionType
    @Binding var selectedVision: DifferentsVisionsView.VisionType
    
    var body: some View {
        Button(action: {
            SoundManager.shared.playEffect(soundName: "button-click-1")
            selectedVision = type
        }) {
            ZStack {
                Rectangle()
                    .frame(width: 180, height: 107)
                    .foregroundColor(Color("button2"))
                    .cornerRadius(12.89)
                    .shadow(radius: 5)
                Text(title)
                    .font(.system(size: 30, weight: .regular))
                    .foregroundColor(.white)
            }
        }
    }
}

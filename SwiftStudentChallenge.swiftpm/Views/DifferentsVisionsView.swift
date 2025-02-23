import SwiftUI

struct DifferentsVisionsView: View {
    
    @State private var moveToNextScreen = false
    @State private var selectedVision: VisionType = .correct
    
    enum VisionType: String {
        case correct = "ScenarioCorrectVision"
        case myopia = "ScenarioMyopia"
        case hyperopia = "ScenarioHyperopia"
        case astigmatism = "ScenarioAstigmatism"
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.lightGray)
                    .ignoresSafeArea()
                VStack(spacing: 100){
                    Spacer()
                    Text("How Each Person Sees the World")
                        .font(.custom(MyCustomFonts.textFont.fontName, size: 56))
                        .foregroundStyle(Color(.darkPink))
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
                        moveToNextScreen = true
                        SoundManager.shared.playEffect(soundName: "button-click-1")
                    }) {
                        ZStack {
                            Rectangle()
                                .frame(width: 284, height: 67)
                                .foregroundColor(Color(.darkPink))
                                .cornerRadius(12.89)
                                .shadow(radius: 5)
                            Text("Next")
                                .font(.system(size: 38, weight: .regular))
                                .foregroundColor(.white)
                        }
                    }
                    .navigationDestination(isPresented: $moveToNextScreen) {
                        FinalView()
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
                    .foregroundColor(selectedVision == type ? Color(.darkPink) : Color(.pink))
                    .cornerRadius(12.89)
                    .shadow(radius: 5)
                Text(title)
                    .font(.system(size: 30, weight: .regular))
                    .foregroundColor(.white)
            }
        }
    }
}

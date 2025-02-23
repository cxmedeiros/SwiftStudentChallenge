import SwiftUI

struct AstigmatismView: View {

    let hasChallenge: Bool = true
    @State private var showChallenge = false
    @State private var showFinalDialog = false
    @State var changeDialog = false
    @State private var showDialog = true
    @State private var moveToNextScreen = false
    @State private var correctLensSelected: Bool = false
    @State private var showExplosion = false
    @State private var rectangleOff = false
    @State private var dialogIndex = 0
    @State private var eyeImage = "Astigmatism"
    @State private var correctLens = "CylindricalLens"
    @State private var draggedLens: String? = nil
    @State private var lensPositions: [String: CGPoint] = [
            "ConcaveLens": CGPoint(x: 130, y: 100),
            "ConvexLens": CGPoint(x: 130, y: 100),
            "CylindricalLens": CGPoint(x: 130, y: 100)
        ]
   
    var body: some View {
        NavigationStack {
            ZStack {
                Color("menu")
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    VStack(spacing: 100) {
                        if showChallenge {
                            ZStack {
                                VStack {
                                    HStack {
                                        Image("Star3")
                                        Spacer()
                                    }
                                    HStack {
                                        Spacer()
                                        Image("Star3")
                                    }
                                }
                                .frame(width: 750, height: 190)
                                Rectangle()
                                    .foregroundStyle(Color("rectangle"))
                                    .frame(width: 677, height: 130)
                                    .cornerRadius(30)
                                Text("Drag the correct lens into the rectangle \n to correct Astigmatism!")
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 30, weight: .semibold))
                                    .foregroundStyle(Color("text"))
                            }
                            .padding(.top, 50)
                        }
                        let dropZone = CGRect(x: -300, y: -300, width: 150, height: 250)
                        VStack(alignment: .center) {
                            Spacer()
                            ZStack {
                                if !rectangleOff && showChallenge {
                                    Rectangle()
                                        .stroke(Color(.text), lineWidth: 2)
                                        .frame(width: 113, height: 237)
                                        .padding(.trailing, 200)
                                }
                                if rectangleOff {
                                    ExplodingView()
                                        .transition(.scale)
                                }
                                Image(eyeImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 690, height: 340)
                            }
                            Spacer()
                            if showChallenge {
                                HStack {
                                    lensView(name: "ConcaveLens", label: "Concave Lens", dropZone: dropZone)
                                    lensView(name: "ConvexLens", label: "Convex Lens", dropZone: dropZone)
                                    lensView(name: "CylindricalLens", label: "Cylindrical Lens", dropZone: dropZone)
                                }
                                .padding()
                            }
                            
                        }
                        Spacer()
                        if changeDialog {
                            DialogBox(
                                isVisible: $showDialog,
                                currentDialogIndex: $dialogIndex,
                                moveToNextScreen: $moveToNextScreen,
                                changeDialog: $changeDialog,
                                currentView: "AstigmatismView",
                                dialogs:DialogData.astigmatismWithLens,
                                dialogColor: Color("dialogBallon2")
                            )
                        } else {
                            DialogBox(
                                isVisible: $showDialog,
                                currentDialogIndex: $dialogIndex,
                                moveToNextScreen: $moveToNextScreen,
                                changeDialog: $changeDialog,
                                currentView: "AstigmatismView",
                                dialogs: DialogData.astigmatism,
                                dialogColor: Color("dialogBallon2")
                            )
                            .onChange(of: dialogIndex) { newValue in
                                if newValue == 1 {
                                    withAnimation {
                                        showChallenge = true
                                    }
                                }
                            }
                            .onChange(of: rectangleOff) { newValue in
                                if newValue {
                                    withAnimation {
                                        showFinalDialog = true
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationDestination(isPresented: $moveToNextScreen) {
            DifferentsVisionsView()
        }
        .navigationBarBackButtonHidden(true)
    }
    private func lensView(name: String, label: String, dropZone: CGRect) -> some
        View {
            VStack(spacing: -10) {
                    Text(label)
                    .font(.system(size: 30, weight: .semibold))
                        .foregroundStyle(correctLensSelected && name == correctLens ? Color("button2") : Color("text"))
                        .padding(.top, 20)
                    Image(name)
                        .resizable()
                        .frame(width: lensSize(for: name).width, height: lensSize(for: name).height)
                        .position(lensPositions[name]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    lensPositions[name] = value.location
                                }
                                .onEnded { value in
                                    checkDrop(name: name, position: value.location, dropZone: dropZone)
                                }
                        )
            }
        }
    private func checkDrop(name: String, position: CGPoint, dropZone: CGRect) {
        if dropZone.contains(position) {
            if name == correctLens {
                SoundManager.shared.playEffect(soundName: "game-sound-correct")
                changeDialog = true
                correctLensSelected = true
                withAnimation {
                    showExplosion = true
                    rectangleOff = true
                    eyeImage = "AstigmatismWithLens"
                    lensPositions[name] = initialPosition(for: name)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showExplosion = false
                    if hasChallenge {
                        dialogIndex = 2
                    }
                }
            }
        } else {
            withAnimation {
                SoundManager.shared.playEffect(soundName: "error-10")
                lensPositions[name] = initialPosition(for: name)
            }
        }
    }
    private func initialPosition(for name: String) -> CGPoint {
        switch name {
            case "ConcaveLens": return CGPoint(x: 130, y: 100)
            case "ConvexLens": return CGPoint(x: 130, y: 100)
            case "CylindricalLens": return CGPoint(x: 130, y: 100)
            default: return .zero
        }
    }
}

private func lensSize(for name: String) -> CGSize {
    switch name {
        case "ConcaveLens": return CGSize(width: 56, height: 127)
        case "ConvexLens": return CGSize(width: 59, height: 127)
        case "CylindricalLens": return CGSize(width: 79, height: 127)
    default: return CGSize(width: 100, height: 100)
    }
}

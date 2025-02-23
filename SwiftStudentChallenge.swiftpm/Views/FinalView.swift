import SwiftUI

struct FinalView: View {
    
    @State private var showDialog = true
    @State private var moveToNextScreen = false
    @State var changeDialog = true
    @State private var dialogIndex = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.lightGray)
                    .ignoresSafeArea()
                VStack {
                    HStack(spacing: 100){
                        Image("ColorBlindnessTest")
                        Image("EyePhoto")
                        Image("VisionProblemTest")
                    }
                    .opacity(0.45)
                    VStack(spacing: 50) {
                        HStack (alignment: .bottom){
                            Image("OphthalmologistChair")
                                .resizable()
                                .scaledToFit()
                                .frame(width:382, height:423)
                            Image("Desk")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .opacity(0.45)
                }
                VStack(spacing: 0) {
                    Image("Character1")
                        .padding(.top, 50)
                    DialogBox(
                        isVisible: $showDialog,
                        currentDialogIndex: $dialogIndex,
                        moveToNextScreen: $moveToNextScreen,
                        changeDialog: $changeDialog,
                        currentView: "FinalView",
                        dialogs: DialogData.final,
                        dialogColor: Color(.offWhite)
                    )
                    
                }
                .padding(.bottom, 50)
            }
            .navigationDestination(isPresented: $moveToNextScreen) {
                MenuView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

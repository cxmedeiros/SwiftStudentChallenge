import SwiftUI

struct CharacterView: View {
    
    @State private var showDialog = true
    @State private var dialogIndex = 0
    @State private var moveToNextScreen = false
    @State var changeDialog = true
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color("menu")
                    .ignoresSafeArea()
                
                VStack {
                    HStack(spacing: 100){
                        Image("ColorBlindnessTest")
                        Image("EyePhoto")
                        Image("VisionProblemTest")
                    }
                    .opacity(0.45)
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
                    }
                    .opacity(0.45)
                }
                VStack (spacing: 0){
                    Image("Mila")
                        .padding(.top, 50)
                    DialogBox(
                        isVisible: $showDialog,
                        currentDialogIndex: $dialogIndex,
                        moveToNextScreen: $moveToNextScreen,
                        changeDialog: $changeDialog,
                        currentView: "MilaView",
                        dialogs: DialogData.intro,
                        dialogColor: Color("dialogBallon1")
                    )
                    
                }
                .padding(.bottom, 50)
                
            }
            .navigationDestination(isPresented: $moveToNextScreen) {
                CorneaPupilIrisView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
}


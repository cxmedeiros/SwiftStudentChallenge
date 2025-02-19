//
//  EyeView.swift
//  SwiftStudentChallenge
//
//  Created by Camila Xavier de Medeiros on 12/02/25.
//

import SwiftUI

struct CorneaPupilIrisView: View {
    
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
                    Spacer()
                    VStack (alignment: .center, spacing: 100) {
                        Image("CorneaPupilIris")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 500, height: 500)
                        
                        Window()
                    }
                    Spacer()
                    VStack (spacing: 0){
                        DialogBox(
                            isVisible: $showDialog,
                            currentDialogIndex: $dialogIndex,
                            moveToNextScreen: $moveToNextScreen,
                            changeDialog: $changeDialog,
                            currentView: "CorneaPupilIrisView",
                            dialogs: DialogData.corneaPupilIris,
                            dialogColor: Color("dialogBallon2")
                        )
                    }
                }
            }
        }
        .navigationDestination(isPresented: $moveToNextScreen) {
            LensView()
        }
        .navigationBarBackButtonHidden(true)
    }
}


//
//  CorrectVision.swift
//  SwiftStudentChallenge
//
//  Created by Camila Xavier de Medeiros on 14/02/25.
//

import SwiftUI

struct CorrectVisionView: View {
    
    @State private var showDialog = true
    @State private var dialogIndex = 0
    @State private var moveToNextScreen = false
    @State private var isChangeDialog = false
    @State var changeDialog = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.lightGray)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    VStack(alignment: .center, spacing: 100) {
                        Image("Retina")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 500, height: 500)
                        Image("CorrectVision")
                    }
                    Spacer()
                    VStack(spacing: 0) {
                        DialogBox(
                            isVisible: $showDialog,
                            currentDialogIndex: $dialogIndex,
                            moveToNextScreen: $moveToNextScreen,
                            changeDialog: $changeDialog,
                            currentView: "CorrectVisionView",
                            dialogs: DialogData.correctVision,
                            dialogColor: Color(.beige)
                        )
                    }
                }
            }
        }
        .navigationDestination(isPresented: $moveToNextScreen) {
            MyopiaView(changeDialog: isChangeDialog)
        }
        .navigationBarBackButtonHidden(true)
    }
}

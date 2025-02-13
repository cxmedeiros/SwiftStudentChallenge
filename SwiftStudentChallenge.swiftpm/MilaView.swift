//
//  MilaView.swift
//  SwiftStudentChallenge
//
//  Created by Camila Xavier de Medeiros on 12/02/25.
//

import SwiftUI

struct MilaView: View {
    
    @State private var showDialog = true
    @State private var dialogIndex = 0
    
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
                            //.frame(width:510, height: 397)
                        }
                    }
                    .opacity(0.45)
                }
                VStack (spacing: 0){
                    Image("Mila")
                    DialogBox(
                        isVisible: $showDialog,
                        currentDialogIndex: $dialogIndex,
                        dialogs: DialogData.intro
                    )
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
}


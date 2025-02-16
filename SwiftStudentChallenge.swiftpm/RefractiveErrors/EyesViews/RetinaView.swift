//
//  RetinaView.swift
//  SwiftStudentChallenge
//
//  Created by Camila Xavier de Medeiros on 14/02/25.
//

import SwiftUI

struct RetinaView: View {
    
    @State private var showDialog = true
    @State private var dialogIndex = 0
    @State private var moveToNextScreen = false
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color("menu")
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    VStack (alignment: .center, spacing: 100) {
                        Image("Retina")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 500, height: 500)
                        
                        
                        Projector()
                            
                    }
                    
                    Spacer()
                    VStack (spacing: 0){
                        DialogBox(
                            isVisible: $showDialog,
                            currentDialogIndex: $dialogIndex,
                            moveToNextScreen: $moveToNextScreen,
                            dialogs: DialogData.retina,
                            dialogColor: Color("dialogBallon2")
                        )
                    }
                }
            }
        }
        .navigationDestination(isPresented: $moveToNextScreen) {
            CorrectVisionView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

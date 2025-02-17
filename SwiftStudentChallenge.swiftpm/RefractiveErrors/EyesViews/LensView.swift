//
//  Lens.swift
//  SwiftStudentChallenge
//
//  Created by Camila Xavier de Medeiros on 14/02/25.
//

import SwiftUI

struct LensView: View {
    
    @State private var showDialog = true
    @State private var dialogIndex = 0
    @State private var moveToNextScreen = false
    @State var mutatingDialog = true
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color("menu")
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    VStack (alignment: .center, spacing: 100) {
                        Image("Lens")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 500, height: 500)
                        
                        
                        MagnifyngGlass()
                            
                    }
                    
                    Spacer()
                    VStack (spacing: 0){
                        DialogBox(
                            isVisible: $showDialog,
                            currentDialogIndex: $dialogIndex,
                            moveToNextScreen: $moveToNextScreen,
                            mutatingDialog: $mutatingDialog,
                            currentView: "LensView",
                            dialogs: DialogData.lens,
                            dialogColor: Color("dialogBallon2")
                        )
                    }
                }
            }
        }
        .navigationDestination(isPresented: $moveToNextScreen) {
            RetinaView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

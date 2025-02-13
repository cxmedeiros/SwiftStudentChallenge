//
//  EyeView.swift
//  SwiftStudentChallenge
//
//  Created by Camila Xavier de Medeiros on 12/02/25.
//

import SwiftUI

struct EyeView: View {
    
    @State private var showDialog = true
    @State private var dialogIndex = 0
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color(.menu)
                    .ignoresSafeArea()
                
                VStack {
                    
                    VStack (alignment: .center) {
                        Image("Cornea")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400, height: 400)
                        
                        Window()
                    }
                    VStack (spacing: 0){
                        DialogBox(
                            isVisible: $showDialog,
                            currentDialogIndex: $dialogIndex,
                            dialogs: DialogData.intro
                        )
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


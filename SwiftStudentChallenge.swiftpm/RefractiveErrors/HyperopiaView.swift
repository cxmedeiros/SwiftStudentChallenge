//
//  Hyperopia.swift
//  SwiftStudentChallenge
//
//  Created by Camila Xavier de Medeiros on 14/02/25.
//

import SwiftUI

struct HyperopiaView: View {
    
    @State private var showDialog = true
    @State private var moveToNextScreen = false
    @State private var dialogIndex = 0
    @State private var eyeImage = "Hyperopia"
    
    @State private var correctLens = "ConvexLens"
    @State private var draggedLens: String? = nil
    @State private var lensPositions: [String: CGPoint] = [
            "ConcaveLens": CGPoint(x: 130, y: 100),
            "ConvexLens": CGPoint(x: 130, y: 100),
            "CylindricalLens": CGPoint(x: 130, y: 100)
        ]
    @State private var showExplosion = false
    @State private var rectangleOff = false
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color("menu")
                    .ignoresSafeArea()
                
                VStack (spacing: 50) {
                    
                    ZStack {
                        
                        Rectangle()
                            .foregroundStyle(Color(.rectangle))
                            .opacity(0.7)
                            .frame(width: 677, height: 130)
                            .cornerRadius(30)
                       

                        VStack {
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color(.star))
                                    .font(.system(size: 40))
                                    .padding()
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Spacer()
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color(.star))
                                    .font(.system(size: 40))
                                    .padding()
                                    
                            }
                        }
                        .frame(width: 720, height: 190)
                    }
                    
                    let dropZone = CGRect(x: -50, y: -300, width: 150, height: 250)
                    
                    VStack (alignment: .center) {
                        
                        VStack (spacing: 0){
//                            Arrow()
//                                .padding(.trailing, 600)
                            
                            ZStack {
                                if !rectangleOff {
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
                        }
                        
                    HStack() {
                        lensView(name: "ConcaveLens", label: "Concave Lens", dropZone: dropZone)
                        lensView(name: "ConvexLens", label: "Convex Lens", dropZone: dropZone)
                        lensView(name: "CylindricalLens", label: "Cylindrical Lens", dropZone: dropZone)
                    }
                    .padding()
                        
                    }
                    
                    VStack (spacing: 0){
                        DialogBox(
                            isVisible: $showDialog,
                            currentDialogIndex: $dialogIndex,
                            moveToNextScreen: $moveToNextScreen,
                            dialogs: DialogData.hyperopia,
                            dialogColor: Color("dialogBallon2")
                        )
                    }
                }
            }
        }
        .navigationDestination(isPresented: $moveToNextScreen) {
            AstigmatismView()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func lensView(name: String, label: String, dropZone: CGRect) -> some View {
        VStack (spacing: 0) {
                Text(label)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(Color(.text))
                    .padding(.top,20)
                
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
                withAnimation {
                    showExplosion = true
                    rectangleOff = true
                    eyeImage = "HyperopiaWithLens"
                    lensPositions[name] = initialPosition(for: name)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showExplosion = false
                }
            } else {
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.error)
                
                withAnimation {
                    lensPositions[name] = initialPosition(for: name)
                }
            }
        } else {
            withAnimation {
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

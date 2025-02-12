//
//  Animations.swift
//  SwiftStudentChallenge
//
//  Created by Camila Xavier de Medeiros on 07/02/25.
//
import SwiftUI

struct OpenCloseEye: View {
    @State private var imageIndex = 0
    @State private var showNextImage = false
    
    @State private var timer: Timer?
    
    let images = ["OpenEye", "CloseEye"]
    
    var body: some View {
        Image(images[imageIndex])
            .resizable()
            .scaledToFit()
            .frame(width: 134, height: 163)
            .onAppear {
                timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                    DispatchQueue.main.async {
                        showNextImage.toggle()
                        imageIndex = (imageIndex + 1) % images.count
                    }
                }
            }
            .onDisappear {
                timer?.invalidate()
                timer = nil
            }
    }
}






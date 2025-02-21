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
            .frame(width: 112, height: 136)
            .onAppear {
                timer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { _ in
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

struct Window: View {
    @State private var imageIndex = 0
    @State private var showNextImage = false
    
    @State private var timer: Timer?
    
    let images = ["OpenWindow", "OpenWindow2", "CloseWindow"]

    var body: some View {
        Image(images[imageIndex])
            .resizable()
            .scaledToFit()
            .frame(width: 311, height: 354)
            .onAppear {
                timer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { _ in
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

struct MagnifyngGlass: View {
    @State private var imageIndex = 0
    @State private var showNextImage = false
    
    @State private var timer: Timer?
    
    let images = ["MagnifyngGlass", "MagnifyngGlassCloseUp"]

    var body: some View {
        Image(images[imageIndex])
            .resizable()
            .scaledToFit()
            .frame(width: 380, height: 330)
            .onAppear {
                timer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { _ in
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

struct Projector: View {
    @State private var imageIndex = 0
    @State private var showNextImage = false
    
    @State private var timer: Timer?
    
    let images = ["ProjectorOff", "ProjectorOn"]

    var body: some View {
        Image(images[imageIndex])
            .resizable()
            .scaledToFit()
            .frame(width: 615, height: 250)
            .onAppear {
                timer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { _ in
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

struct Arrow: View {
    @State private var imageIndex = 0
    @State private var showNextImage = false
    
    @State private var timer: Timer?
    
    let images = ["Arrow2", "Arrow3"]

    var body: some View {
        Image(images[imageIndex])
            .resizable()
            .scaledToFit()
            .frame(width: 134, height: 163)
            .onAppear {
                timer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { _ in
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

struct ExplodingView: View {

    let colors: [Color] = [Color("button"), Color("rectangle"), Color("star"), Color("text")]
    @State private var isExploded = false
    private let explodingBits: Int = 75
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                ForEach(0..<explodingBits, id: \.self) { index in
                    Rectangle()
                        .rotation(Angle(degrees: Double.random(in: 0..<360)))
                        .frame(width: 20, height: 20)
                        .foregroundColor(colors[index % 4])
                        .offset(x: isExploded ? (Double.random(in: -1...1) * 500) : 0, y: isExploded ? (Double.random(in: -1...1) * 500) : 0)
                        .opacity(isExploded ? 0 : 1)
                        .animation(.easeInOut.speed(0.4), value: isExploded)
                        .padding()
                }
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isExploded = true
            }
        }
    }
}

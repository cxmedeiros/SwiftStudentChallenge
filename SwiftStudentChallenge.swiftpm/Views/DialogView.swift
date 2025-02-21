import SwiftUI

struct DialogBox: View {
    
    @Binding var isVisible: Bool
    @Binding var currentDialogIndex: Int
    @Binding var moveToNextScreen: Bool
    @Binding var changeDialog: Bool
    var currentView: String
    var dialogs: [Dialog]
    var dialogColor: Color
    let allowedViews = ["MyopiaView", "HyperopiaView", "AstigmatismView"]
    var isAllowedView: Bool {
        return allowedViews.contains(currentView)
    }
    
    @State private var text: String = ""
    @State private var dialogsIndex: Int = 0
    @State private var characterIndex: Int = 0
    @State private var timer: Timer? = nil
    @State private var isAnimating: Bool = false
    
    var body: some View {
        
        if isVisible {
            
            ZStack {
                
                Rectangle()
                    .frame(width: 800, height:150)
                    .foregroundColor(dialogColor)
                    .cornerRadius(12.89)
                    .shadow(radius: 5)
                
                VStack () {
                    
                    Text(text)
                        .font(.system(size: 25))
                        .foregroundStyle(Color("button"))
                        .frame(maxWidth: 700, maxHeight: 100, alignment: .leading)
                        .padding(.horizontal, 20)
                    
                    HStack{
                        Button(action: {
                            SoundManager.shared.playEffect(soundName: "button-click-1")
                            moveToNextDialog()
                        }, label: {
                            Image("Arrow")
                                .font(.system(size: 35))
                                .foregroundColor(Color("button"))
                        })
                        .padding(.trailing, 40)
                        .padding(.bottom, 20)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            .onAppear {
                resetDialogBox()
                startTyping()
            }
            .onDisappear {
                resetDialogBox()
                stopTimer()
            }
        }
    }
    
    private func resetDialogBox() {
        text = ""
        dialogsIndex = 0
        currentDialogIndex = dialogsIndex
        isAnimating = false
        startTyping()
    }
    
    private func startTyping() {
        stopTimer()
        characterIndex = 0
        text = ""
        isAnimating = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { _ in
            DispatchQueue.main.async {
                if characterIndex < dialogs[dialogsIndex].string.count {
                    let dialogString = dialogs[dialogsIndex].string
                    let char = dialogString[dialogString.index(dialogString.startIndex, offsetBy: characterIndex)]
                    text.append(char)
                    characterIndex += 1
                } else {
                    stopTimer()
                    isAnimating = false
                }
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func moveToNextDialog() {
        if isAnimating {
            let remainingText = dialogs[dialogsIndex].string.suffix(dialogs[dialogsIndex].string.count - characterIndex)
            text.append(contentsOf: remainingText)
            characterIndex = dialogs[dialogsIndex].string.count
            stopTimer()
            isAnimating = false
        } else if dialogsIndex < dialogs.count - 1 {
            dialogsIndex += 1
            currentDialogIndex = dialogsIndex
            startTyping()
        } else if isAllowedView {
            if changeDialog {
                moveToNextScreen = true
            }
        } else {
                moveToNextScreen = true
        }
    }
}


struct Dialog {
    let string: String
}

struct DialogData {
    static let intro: [Dialog] = [
        Dialog(string: "Hi, my name is Mila, and I'm an ophthalmologist!"),
        Dialog(string: "Let’s learn a little more about our eyes and why millions of people, like me, wear glasses.")
    ]
    
    static let corneaPupilIris: [Dialog] = [
        Dialog(string: "Imagine the eye as a window."),
        Dialog(string: "The cornea is the glass, allowing light to enter. But this light needs control, right?"),
        Dialog(string: "That’s where the pupil and iris come in, like a curtain that opens and closes to adjust the amount of light.")
    ]
    
    static let lens: [Dialog] = [
        Dialog(string: "Inside the eye, we have natural lenses that work like magnifying glasses, adjusting the focus so we can see clearly.")
    ]
    
    static let retina: [Dialog] = [
        Dialog(string: "And where is this image projected?"),
        Dialog(string: "At the back of the eye, on the retina, which works like a movie screen! It captures images and sends them to the brain. Amazing, right?")
    ]
    
    static let correctVision: [Dialog] = [
        Dialog(string: "When everything works properly, the image is focused perfectly on the retina, and you see the world clearly."),
        Dialog(string: "But sometimes, our eyes need a little help...")
    ]
    
    static let myopia: [Dialog] = [
        Dialog(string: "People with myopia see well up close, but distant objects appear blurry."),
        Dialog(string: "Let’s try a challenge! Which lens can fix this?"),
    ]
    
    static let myopiaWithLens: [Dialog] = [
        Dialog(string: "That’s right! A concave lens spreads the light a little before it reaches the eye, placing the image in the right spot!")
    ]
    
    static let hyperopia: [Dialog] = [
        Dialog(string: "Now, with hyperopia, the eye focuses the image behind the retina. The result? Nearby objects look blurry!"),
        Dialog(string: "Which lens can correct hyperopia?")
    ]
    
    static let hyperopiaWithLens: [Dialog] = [
        Dialog(string: "Great! A convex lens helps bring the image into focus at the right spot!")
    ]
    
    static let astigmatism: [Dialog] = [
        Dialog(string: "With astigmatism, the cornea has an irregular, slightly oval shape. This causes light to scatter, making vision distorted."),
        Dialog(string: "Do you know which lens can fix this?")
    ]
    
    static let astigmatismWithLens: [Dialog] = [
        Dialog(string: "Correct! Cylindrical lenses adjust the way light enters, making the image sharper and clearer."),
        Dialog(string: "Now that we understand these vision problems, let's finish by seeing in practice how each person experiences the world!")
    ]

}







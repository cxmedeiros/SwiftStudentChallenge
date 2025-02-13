//
//  DialogueView.swift
//  SwiftStudentChallenge
//
//  Created by Camila Xavier de Medeiros on 12/02/25.
//

import SwiftUI

struct DialogBox: View {
    
  @Binding var isVisible: Bool
  @Binding var currentDialogIndex: Int
  @State private var text: String = ""
  @State private var dialogsIndex: Int = 0
  @State private var characterIndex: Int = 0
  @State private var timer: Timer? = nil
  @State private var isAnimating: Bool = false
  var dialogs: [Dialog]
     
  var body: some View {
      
    if isVisible {
          
        ZStack {
            
            Rectangle()
                .frame(width: 800, height:150)
                .foregroundColor(Color("dialogBallon"))
                .cornerRadius(12.89)
                .shadow(radius: 5)
            
            VStack () {
                
                Text(text)
                    .font(.custom("SFPro", size: 25))
                    .frame(maxWidth: 700, alignment: .leading)
                    .padding(.horizontal, 20)
                
                HStack{
                    Button(action: {
                        moveToNextDialog()
                    }, label: {
                        Image("Arrow")
                            .font(.system(size: 35))
                            .foregroundColor(Color("button"))
                    })
                    .padding(.trailing, 40)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .frame(width: 800, height: 150)
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
    } else {
      isVisible = false
    }
  }
}

struct Dialog {
  let string: String
}

struct DialogData {
  static let intro: [Dialog] = [
    Dialog(string: "Hi, I'm Lucy, I'm an environmental researcher. Welcome to my lab."),
    Dialog(string: "We're in the best place to make new discoveries and investigate problems linked to climate change. \nHere, we keep a close eye on sea levels and their changes."),
    Dialog(string: "It looks like we've just received an alert. Let's check it out.")
  ]
}







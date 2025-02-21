import SwiftUI

//struct CreditsView: View {
//    
//    var body: some View {
//        
//        NavigationStack {
//            
//            ZStack {
//                
//                Color("menu")
//                    .ignoresSafeArea()
//    
//            }
            
//        }
//    }
//}
//
struct CustomBackButton: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        SoundManager.shared.playEffect(soundName: "button-click-1")
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 30))
                            Text("Back")
                                .font(.system(size: 40))
                        }
                        .foregroundColor(Color("button"))
                    }
                }
            }
    }
}

struct CreditsView: View {
    let creditTexts = [
        "Desenvolvido por: Camila",
        "Design: Equipe Criativa",
        "Apoio: Amigos e Família",
        "Obrigado por jogar!"
    ]
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color("menu")
                    .ignoresSafeArea()
                Image("Background")
                    .resizable()
                    .scaledToFit()
                    .overlay(
                        // TabView passando dentro das lentes do óculos
                        CreditsScrollingText()
                    )
         
                  
            }
            .modifier(CustomBackButton())
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct CreditsScrollingText: View {
    let creditTexts = [
        "Desenvolvido por: Camila",
        "Design: Equipe Criativa",
        "Apoio: Amigos e Família",
        "Obrigado por jogar!"
    ]
    
    var body: some View {
        TabView {
            ForEach(creditTexts, id: \.self) { text in
                Text(text)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(width: 280, height: 100)
            }
        }
        .frame(width: 280, height: 100)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    CreditsView()
}


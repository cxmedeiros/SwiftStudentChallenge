import SwiftUI

struct CreditsView: View {
    
    @State private var currentIndex = 0
    @Environment(\.presentationMode) var presentationMode

    let pages: [AnyView] = [
        AnyView(CreditPage()),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.lightGray)
                    .ignoresSafeArea()
            
                ScrollView (.vertical, showsIndicators: false) {
                   
                    CreditPage()
                    
                }
            }
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
                        .foregroundColor(Color(.darkPink))
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct CreditPage: View {
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Credits")
                .font(.custom(MyCustomFonts.textFont.fontName, size: 72))
                .foregroundColor(Color(.darkPink))
            ZStack {
                Rectangle()
                    .frame(width: 780, height: 202)
                    .cornerRadius(20)
                    .foregroundStyle(Color(.turquoise))
                    HStack(spacing: 30) {
                        Image("Character2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 132, height: 180)
                        
                        Text("I'm Camila, a 22 year old computer engineering student from Brazil. I'm passionate about integrating education, health, and technology!")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 24, weight: .regular))
                            .frame(width: 394)
                            .foregroundColor(.white)
                }
            }
            HStack {
                VStack {
                    Text("Illustrations")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundColor(Color(.darkPink))
                    ZStack {
                        Rectangle()
                            .frame(width: 390, height: 225)
                            .cornerRadius(20)
                            .foregroundStyle(Color(.darkPink))
                        Text("Made by Camila Xavier (me) specially for this project, but I had inspiration from websites such as Pinterest and Freepik, and my Memoji.")
                            .frame(width: 355, height: 220)
                            .font(.system(size: 22, weight: .regular))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                }
                VStack {
                    Text("Code Reference")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundColor(Color(.darkPink))
                    ZStack {
                        Rectangle()
                            .frame(width: 390, height: 225)
                            .cornerRadius(20)
                            .foregroundStyle(Color(.darkPink))
                        Text("""
                Animating Shapes (Explosion Animarion) - APPLE INC.
                SWIFT PLAYGROUNDS SOFTWARE LICENSE AGREEMENT
                
                Placing Custom Font: MIT License
                Copyright (c) 2022 Alessandra Luana Nascimento Pereira.
                """)
                            .frame(width: 355, height: 220)
                            .font(.system(size: 22, weight: .regular))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                }
            }
            ZStack {
                VStack {
                    Text("Sounds")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundColor(Color(.darkPink))
                    Rectangle()
                        .frame(width: 780, height: 385)
                        .cornerRadius(20)
                        .foregroundStyle(Color(.turquoise))
                }
                Text("""
                     Relaxing Light Background (loop ver.2) by AudioCoffee -` https://freesound.org/s/725613/` - License: Attribution NonCommercial 4.0
                     
                     Button Click 1.wav by Mellau - `https://freesound.org/s/506054/` - License: Attribution NonCommercial 4.0
                     
                     Error #10 by Universfield - `https://freesound.org/s/734446/` - License: Attribution 4.0
                     
                     Game Sound Correct.wav by Bertrof - `https://freesound.org/s/131660/` - License: Attribution 3.0
                     """)
                        .padding(.top, 40)
                        .frame(width: 743, height: 385)
                        .font(.system(size: 22, weight: .regular))
                        .foregroundColor(.white)
            }
            VStack {
                VStack {
                    Text("References")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundColor(Color(.darkPink))
                    ZStack {
                        Rectangle()
                            .frame(width: 780, height: 386)
                            .cornerRadius(20)
                            .foregroundStyle(Color(.darkPink))
                        Text("""
                             Everything that New Vision teaches was found in articles on anatomy and morphology of the human visual system and the study of optical lenses for correcting vision problems.
                             
                             H. E. A. Bicas, “Morfologia do sistema visual,” Medicina (Ribeirão Preto), vol. 30, no. 1, pp. 7–15, Mar. 1997, doi: 10.11606/issn.2176-7262.v30i1p7-15.

                             D. Wolfart, O estudo de lentes ópticas associadas à correção da visão humana no ensino de óptica geométrica, Bachelor's Degree in Physics, International University Center UNINTER, Curitiba, Brazil, 2017. Available at: `https://repositorio.uninter.com/bitstream/handle/1/1122/DAINARA%20WOLFART_2821068.pdf.`
                             """)
                                .frame(width: 743, height: 386)
                                .font(.system(size: 22, weight: .regular))
                                .foregroundColor(.white)
                    }
                }
            }
            VStack() {
                Text("Fonts")
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(Color(.darkPink))
                ZStack {
                    Rectangle()
                        .frame(width: 780, height: 200)
                        .cornerRadius(20)
                        .foregroundStyle(Color(.turquoise))
                    Text("""
                             Copyright (c) 2011, Pablo Impallari (`www.impallari.com|impallari@gmail.com`), Rodrigo Fuenzalida ('www.rfuenzalida.com') with Reserved Font Name Cantora -  SIL Open Font License, Version 1.1.
                             
                             SF Pro (`https://developer.apple.com/fonts/`)
                             """)
                    .frame(width: 745, height: 200)
                    .font(.system(size: 22, weight: .regular))
                    .foregroundColor(.white)
                }
            }
        }
    }
}

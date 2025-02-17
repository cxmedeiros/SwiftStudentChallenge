import SwiftUI

struct DifferentsVisionsView: View {
    
    @State private var isNavigating = false
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                Color("menu")
                    .ignoresSafeArea()
                
                VStack(spacing: 100){
                    
                    Text("How Each Person Sees the World")
                        .font(.system(size: 40, weight: .medium))
                        .foregroundStyle(Color("button"))
                    
                    ZStack {
                        
                        VStack {
                            HStack {
                                Image("Star1")
                                Spacer()
                            }

                            HStack {
                                Spacer()
                                Image("Star1")
                                
                            }
                        }
                        .frame(width: 800, height: 107)
                        
                        HStack{
                            Button(action: {}) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 180, height: 107)
                                        .foregroundColor(Color("button2"))
                                        .cornerRadius(12.89)
                                        .shadow(radius: 5)
                                    Text("Correct \n Vision")
                                        .font(.system(size: 30, weight: .regular))
                                        .foregroundColor(.white)
                                }
                            }
                            Button(action: {}) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 180, height: 107)
                                        .foregroundColor(Color("button2"))
                                        .cornerRadius(12.89)
                                        .shadow(radius: 5)
                                    Text("Myopia")
                                        .font(.system(size: 30, weight: .regular))
                                        .foregroundColor(.white)
                                }
                            }
                            Button(action: {}) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 180, height: 107)
                                        .foregroundColor(Color("button2"))
                                        .cornerRadius(12.89)
                                        .shadow(radius: 5)
                                    Text("Hyperopia")
                                        .font(.system(size: 30, weight: .regular))
                                        .foregroundColor(.white)
                                }
                            }
                            Button(action: {}) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 180, height: 107)
                                        .foregroundColor(Color("button2"))
                                        .cornerRadius(12.89)
                                        .shadow(radius: 5)
                                    Text("Astigmatism")
                                        .font(.system(size: 30, weight: .regular))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        
                    }
                    Button(action: {}) {
                        ZStack {
                            Rectangle()
                                .frame(width: 284, height: 67)
                                .foregroundColor(Color(.button))
                                .cornerRadius(12.89)
                                .shadow(radius: 5)
                            Text("Next")
                                .font(.system(size: 38, weight: .regular, design: .default))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

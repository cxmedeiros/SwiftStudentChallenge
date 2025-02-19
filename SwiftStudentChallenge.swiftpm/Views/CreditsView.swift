import SwiftUI

struct CreditsView: View {
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color("menu")
                    .ignoresSafeArea()
    
            }
            .modifier(CustomBackButton())
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct CustomBackButton: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
        
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 20))
                            Text("Back")
                                .font(.system(size: 30))
                        }
                        .foregroundColor(Color("button"))
                    }
                }
            }
    }
}

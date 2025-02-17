import SwiftUI

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

struct ExplodingView_Previews: PreviewProvider {
    static var previews: some View {
        ExplodingView()
    }
}

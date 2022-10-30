import UIKit


// Viewではなく、特定のプロパティの変化に対してアニメーションをつける場合は
// withAnimation関数を使う

struct ContentView: View {
    @State private var flag = true
    var body: some View {
        ZStack {
            HStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .scaleEffect(flag ? 1.0 : 2.0)
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .scaleEffect(flag ? 1.0 : 0.5)
            }
 
            VStack {
                Spacer()
                Button("アニメーション") {
                    withAnimation() {
                        self.flag.toggle()  // flagの変更がアニメーション化される
                    }
                }
            }
        }
    }
}

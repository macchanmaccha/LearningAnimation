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

// Viewの形状やエフェクトの変化に対して、アニメーションをつける場合は
// .animation(_,value:)
// valueには変数を指定。この変数が変更したらアニメートするよってもの
struct ContentView: View {
    @State var circleCenter = CGPoint.zero
    @State var isCircleScaled = false
    var body: some View {
        VStack {
            Circle()
                .frame(width: 50, height: 50)
                .scaleEffect(isCircleScaled ? 2 : 1)
                .animation(.easeInOut, value: isCircleScaled)
                .offset(x: circleCenter.x - 25, y: circleCenter.y - 25)
                .animation(.spring(response: 0.3, dampingFraction: 0.1), value: circleCenter)
                .gesture(
                    DragGesture(minimumDistance: 0).onChanged { value in
                        circleCenter = value.location
                    }
                )
            Toggle(
                "Scale",
                isOn: $isCircleScaled
            )
        }
    }
}

//
//  LottieAnimation.swift
//  Tasks
//
//  Created by siddhatech on 31/07/24.
//

import SwiftUI
import Lottie

// Step 2: Create LottieView
struct LottieView: UIViewRepresentable {
    var animationName: String
    var loopMode: LottieLoopMode = .loop

    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)

        let animationView = LottieAnimationView(name: animationName)
        animationView.contentMode = .scaleToFill
        animationView.loopMode = loopMode
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

// Step 5: Use LottieView in ContentView
struct ContentView1: View {
    var body: some View {
        ZStack{
            LottieView(animationName: "background1")
                .frame(height: .infinity)
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                  
                LottieView(animationName: "Example")
                    .frame(width: .infinity, height: 300)
                LottieView(animationName: "Winner")
                    .frame(width: .infinity, height: 400)
                    .rotationEffect(.degrees(0))
            }
            }.frame(maxWidth: .infinity,maxHeight: .infinity)
         .ignoresSafeArea(.all)
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}

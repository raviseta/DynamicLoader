//
//  ContentView.swift
//  DynamicLoader
//
//  Created by Ravi Seta on 29/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var rotate = false
    @State private var trimEnd: CGFloat = 0.2
    @State private var trimStart: CGFloat = 0
    
    var body: some View {
        Circle()
            .trim(from: trimStart, to: trimEnd)
            .stroke(
                LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 8, lineCap: .round)
            )
            .frame(width: 100, height: 100)
            .rotationEffect(.degrees(rotate ? 360 : 0))
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                    rotate.toggle()
                }
                withAnimation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                    trimStart = 0.6
                    trimEnd = 1
                }
            }
    }
}

#Preview {
    ContentView()
}

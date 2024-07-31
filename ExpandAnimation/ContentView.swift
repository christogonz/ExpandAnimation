//
//  ContentView.swift
//  ExpandAnimation
//
//  Created by Christopher Gonzalez on 2024-07-29.
//

import SwiftUI

struct ContentView: View {
    @State var isAnimating: Bool = true
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            
            ZStack {
                ExpandingView(expand: $isAnimating, direction: .bottom, symbolName: "phone.fill")
                ExpandingView(expand: $isAnimating, direction: .left, symbolName: "message")
                ExpandingView(expand: $isAnimating, direction: .top, symbolName: "house.fill")
                ExpandingView(expand: $isAnimating, direction: .right, symbolName: "mic.fill")
                
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 50, weight: isAnimating ? .regular : .semibold, design: .rounded))
                    .foregroundStyle(isAnimating ? .white : .black)
                    .rotationEffect(isAnimating ? .degrees(45) : .degrees(0))
                    .scaleEffect(isAnimating ? 3 : 1)
                    .opacity(isAnimating ? 0.25 : 1)
                    .animation(Animation.spring(response: 0.35, dampingFraction: 0.85, blendDuration: 1), value: isAnimating)
                    .onTapGesture {
                        isAnimating.toggle()
                    }
            }
        }
    
    }
}

#Preview {
    ContentView()
}

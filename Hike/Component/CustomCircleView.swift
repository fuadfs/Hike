//
//  CustomCircleView.swift
//  Hike
//
//  Created by Fuad Fadlila Surenggana on 18/02/24.
//

import SwiftUI

struct CustomCircleView: View {
    
    @State private var isAnimatedGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [.customIndigoMedium, .customSalmonLight],
                                   startPoint: isAnimatedGradient ? .topLeading : .bottomLeading,
                                   endPoint: isAnimatedGradient ? .bottomTrailing : .topTrailing))
                
                .onAppear() {
                    withAnimation(.linear(duration: 3).repeatForever(autoreverses: true) ) {
                        isAnimatedGradient.toggle()
                    }
                }
            MotionAnimationView()
        } //: ZSTACK
        .frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircleView()
}

//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Camila Campana on 16/05/22.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - Properties

    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false

    // MARK: - Functions

    // 1. Random coordinate
    func randomCoordinate(max: CGFloat) -> CGFloat {
        CGFloat.random(in: 0...max)
    }

    // 2. Random size
    func randomSize() -> CGFloat {
        CGFloat(Int.random(in: 10...300))
    }

    // 3. Random scale
    func randomScale() -> CGFloat {
        CGFloat(Double.random(in: 0.1...2.0))
    }

    // 4. Random speed
    func randomSpeed() -> Double {
        Double.random(in: 0.025...1.0)
    }

    // 5. Random delay
    func randomDelay() -> Double {
        Double.random(in: 0...2)
    }

    // MARK: - Body

    var body: some View {
        GeometryReader { metrics in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: metrics.size.width),
                            y: randomCoordinate(max: metrics.size.height)
                    )
                    .animation(
                        Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        , value: isAnimating
                    )
                    .onAppear {
                        isAnimating = true
                    }
                } //: Loop
            } //: ZStack
            .drawingGroup()
        } //: Geometry
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}

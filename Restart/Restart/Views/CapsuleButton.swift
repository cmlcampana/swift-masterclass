//
//  CapsuleButton.swift
//  Restart
//
//  Created by Camila Campana on 11/05/22.
//

import SwiftUI

struct CapsuleButton: View {

    let textTitle: String
    let customAction: () -> Void

    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimation: Bool = false

    var body: some View {
        ZStack {
            // PARTS OD THE CUSTOM BUTTON

            // 1. BACKGROUND (STATIC)

            Capsule()
                .fill(Color.white.opacity(0.2))

            Capsule()
                .fill(Color.white.opacity(0.2))
                .padding(8)

            // 2. CALL-TO-ACTION (STATIC)

            Text(textTitle)
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .offset(x: 20)

            // 3. CAPSULE(DYNAMIC WIDTH)

            HStack {
                Capsule()
                    .fill(Color("ColorRed"))
                    .frame(width: buttonOffset + 80)

                Spacer()
            }

            // 4. CIRCLE (DRAGGABLE)

            HStack {
                ZStack {
                    Circle()
                        .fill(Color("ColorRed"))
                    Circle()
                        .fill(.black.opacity(0.15))
                        .padding(8)

                    Image(systemName: "chevron.right.2")
                        .font(.system(size: 24, weight: .bold))
                }
                .foregroundColor(.white)
                .frame(width: 80, height: 80, alignment: .center)
                .offset(x: buttonOffset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                buttonOffset = gesture.translation.width
                            }
                        }
                        .onEnded { _ in
                            withAnimation(Animation.easeOut(duration: 0.4)) {
                                if buttonOffset > buttonWidth / 2 {
                                    playSound(sound: "chimeup", type: "mp3")
                                    buttonOffset = buttonWidth - 80
                                    customAction()
                                } else {
                                    buttonOffset = 0
                                }
                            }
                        }
                )

                Spacer()
            }
        }
        .frame(width: buttonWidth, height: 80, alignment: .center)
        .padding()
        .opacity(isAnimation ? 1 : 0)
        .offset(y: isAnimation ? 0 : 40)
        .animation(.easeOut(duration: 1), value: isAnimation)
        .onAppear {
            isAnimation = true
        }
    }
}

struct CapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)

            CapsuleButton(textTitle: "Get Started", customAction: { })
        }
    }
}

//
//  Card.swift
//  LearnByDoing
//
//  Created by Camila Campana on 30/05/22.
//

import SwiftUI

struct CardView: View {

    // MARK: - Properties
    let card: Card

    @State private var fadeIn: Bool = false
    @State private var moveDownward: Bool = false
    @State private var moveUpward: Bool = false
    @State private var showAlert: Bool = false

    // MARK: - Body

    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadeIn ? 1.0 : 0.0)

            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                Text(card.headline)
                    .fontWeight(.light)
                    .italic()
            }
            .foregroundColor(.white)
            .offset(y: moveDownward ? -218 : -300)

            Button(action: {
                playSound(sound: "sound-chime", type: "mp3")
                showAlert.toggle()
            }) {
                Text(card.callToAction.uppercased())
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .tint(.white)

                Image(systemName: "arrow.right.circle")
                    .font(.title.weight(.medium))
                    .tint(.white)
            }
            .padding(.vertical)
            .padding(.horizontal, 24)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: card.gradientColors),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(Capsule())
            .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            .offset(y: moveUpward ? 210 : 300)
        }
        .frame(width: 335, height: 545)
        .background(
            LinearGradient(
                gradient: Gradient(colors: card.gradientColors),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear {
            withAnimation(.linear(duration: 1.2)) {
                fadeIn.toggle()
            }

            withAnimation(.linear(duration: 0.8)) {
                moveDownward.toggle()
                moveUpward.toggle()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(card.title),
                message: Text(card.message),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[0])
            .previewLayout(.sizeThatFits)
    }
}

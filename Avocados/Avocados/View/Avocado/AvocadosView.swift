//
//  AvicadosView.swift
//  Avocados
//
//  Created by Camila Campana on 30/05/22.
//

import SwiftUI

struct AvocadosView: View {
    // MARK: - Properties

    private let headers = headerData
    private let facts = factsData

    @State private var pulseAnimation = false

    // MARK: - Body

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {

                // MARK: - Header

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(headers) { item in
                            HeaderView(header: item)
                        }
                    }
                }
                
                Spacer()
                Image("avocado")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120, alignment: .center)
                    .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 8)
                    .scaleEffect(pulseAnimation ? 1 : 0.9)
                    .opacity(pulseAnimation ? 1 : 0.9)
                    .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: pulseAnimation)

                VStack {
                    Text("Avocados")
                        .font(.system(size: 24, weight: .bold, design: .serif))
                        .foregroundColor(Color("ColorGreenAdaptive"))
                        .padding()
                        .shadow(color: Color("ColorBlackTransparentDark"), radius: 4, x: 0, y: 4)

                    Text("""
    Creamy, green, and full of nutrients!
    Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!
    """)
                        .lineLimit(nil)
                        .font(.system(.footnote, design: .serif))
                        .foregroundColor(Color("ColorGreenLight"))
                        .multilineTextAlignment(.center)
                        .lineSpacing(8)
                        .frame(maxWidth: 640, minHeight: 120)
                }
                .padding()

                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .padding(0)
        .onAppear {
            pulseAnimation.toggle()
        }
    }
}

struct AvicadosView_Previews: PreviewProvider {
    static var previews: some View {
        AvocadosView()
            .environment(\.colorScheme, .dark)
    }
}

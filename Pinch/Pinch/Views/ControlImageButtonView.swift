//
//  ControlImageButtonView.swift
//  Pinch
//
//  Created by Camila Campana on 11/05/22.
//

import SwiftUI

struct ControlImageButtonView: View {
    let icon: String
    let action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: icon)
                .font(.system(size: 36))
        }
    }
}

struct ControlImageButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageButtonView(icon: "minus.magnifyingglass", action: { })
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

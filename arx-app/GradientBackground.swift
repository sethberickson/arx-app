//
//  GradientBackground.swift
//  arx-app
//
//  Created by Seth Erickson on 6/6/22.
//

import SwiftUI

struct GradientBackground: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [ColorConstants.arxLightBlue, ColorConstants.arxNavy]), startPoint: .bottomLeading, endPoint: .topTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

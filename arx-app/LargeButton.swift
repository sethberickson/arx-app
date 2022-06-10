//
//  LargeButton.swift
//  arx-app
//
//  Created by Seth Erickson on 6/9/22.
//

import SwiftUI

struct LargeButton: View {

    var text: String
    let action: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .frame(width: 300, height: 100, alignment: .center)
            .foregroundColor(ColorConstants.white)
            .shadow(color: .gray, radius: 3, x: 0, y: 0)
            .overlay(
                Text("\(text)")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(ColorConstants.arxNavy) // text color
                    .background(.clear)
            )
            .onTapGesture {
                self.action()
            }
    }
}

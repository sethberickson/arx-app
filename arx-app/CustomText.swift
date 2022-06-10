//
//  CustomText.swift
//  ARTests
//
//  Created by Seth Erickson on 3/16/22.
//

import SwiftUI

struct CustomText: View {
    var text: String
    var size: CGFloat
        
    var body: some View {
        Text(text)
            .font(Font.custom(FontConstants.mainFont, size: size))
    }
}

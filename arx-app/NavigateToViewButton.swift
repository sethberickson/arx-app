//
//  NavigateToViewButton.swift
//  AREA
//
//  Created by Seth Erickson on 2/24/22.
//

import SwiftUI

/// Button with three parameters:
/// 1: Text - String to be displayed on button
/// 2: Position - location on the screen. Acceptable values: topLeft, topCenter, topRight, middleLeft, middleCenter, middleRight, bottomLeft, bottomCenter, bottomRight
/// 3: NavigateTo - View that will be navigated to on tap
struct NavigateToViewButton<Content>: View where Content: View {
    let text: String
    let content: Content // this is a View that will be navigated to on tap
    let position: ButtonPosition
    @Environment(\.dismiss) var dismiss
    
    @State var isClicked: Bool = false
    
    init (text: String, position: ButtonPosition, navigateTo: () -> Content){
        self.text = text
        self.position = position
        self.content = navigateTo()
    }
    
    var body: some View {
        VStack{
            if position == .bottomLeft || position == .bottomCenter || position == .bottomRight {
                Spacer() // positions button at the bottom of the screen
            }
            HStack{
                if position == .topRight || position == .middleRight || position == .bottomRight {
                    Spacer() // positions button at right of screen
                }
                if isClicked == false {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 200, height: 50, alignment: .center)
                        .foregroundColor(ColorConstants.white)
                        .overlay(
                            Text("\(text)")
                                .font(.system(size: 500))
                                .fontWeight(.bold)
                                .lineLimit(10)
                                .minimumScaleFactor(0.01)
                                .foregroundColor(ColorConstants.arxNavy) // text color
                                .background(.clear)
                        )
//                        .modifier(ButtonShadow()) // Adds a constant button shadow (modifier is found in Constants file)
                        .onTapGesture {
//                            dismiss.callAsFunction()
                            isClicked = true
                        }
                    if position == .topLeft || position == .middleLeft || position == .bottomLeft {
                        Spacer() // positions button at left of screen
                    }
                }
            }
            if position == .topLeft || position == .topCenter || position == .topRight {
                Spacer() // positions button at top of screen
            }
        }
        .navigate(to: content, when: $isClicked)
    }
}

enum ButtonPosition: CaseIterable {
    case topLeft
    case topCenter
    case topRight
    case middleLeft
    case middleCenter
    case middleRight
    case bottomLeft
    case bottomCenter
    case bottomRight
}

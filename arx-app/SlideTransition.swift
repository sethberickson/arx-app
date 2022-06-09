//
//  SlideTransition.swift
//  arx-app
//
//  Created by Seth Erickson on 3/17/22, modified on 6/6/22.
//

import SwiftUI

struct SlideTransition: ViewModifier {
    let shift: CGFloat
    
    func body(content: Content) -> some View {
        let c = content
        return ZStack {
            c.clipShape(QuadClipShap(left: true, top: true)).offset(x: 0, y: -shift) // top left, shift up
            c.clipShape(QuadClipShap(left: false, top: true)).offset(x: shift, y: 0) // top right, shift right
            c.clipShape(QuadClipShap(left: false, top: false)).offset(x: 0, y: shift) // bottom right, shift down
            c.clipShape(QuadClipShap(left: true, top: false)).offset(x: -shift, y: 0) // bottom left, shift left
        }.ignoresSafeArea() // Had to add this so the parent view can use the ignores safe area
    }
}

struct QuadClipShap: Shape {
    /// This struct cuts a shape into four equal parts directly down the middle in both directions.
    /// - Example:
    ///     - .transition(AnyTransition.modifier(active: SlideTransition(shift: 1000), identity: SlideTransition(shift: 0)))
    var left: Bool
    var top: Bool
        
    func path(in rect: CGRect) -> Path {
        // split view into 4 quadrants
        return Path { path in
            let width = rect.width
            let height = rect.height
            
            let startx:CGFloat = left ? 0 : width/2
            let starty: CGFloat = top ? 0 : height/2
            let shapeWidth:CGFloat = width/2
            let shapeHeight: CGFloat = height/2
            
            path.move(to: CGPoint(x: startx, y: starty))
            
            path.addLines([
                CGPoint(x: startx+shapeWidth, y: starty),
                CGPoint(x: startx+shapeWidth, y: starty+shapeHeight),
                CGPoint(x: startx, y: starty+shapeHeight),
                CGPoint(x: startx, y: starty)
            ])
        }
    }
}


//
//  BottomRoundedRectangle.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 13/12/2024.
//

import SwiftUI

struct BottomRoundedRectangle: Shape {
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let topLeft = CGPoint(x: rect.minX, y: rect.minY)
        let topRight = CGPoint(x: rect.maxX, y: rect.minY)
        let bottomRight = CGPoint(x: rect.maxX, y: rect.maxY)
        let bottomLeft = CGPoint(x: rect.minX, y: rect.maxY)
        
        // Start at top-left
        path.move(to: topLeft)
        path.addLine(to: topRight) // Straight line to top-right
        path.addLine(to: CGPoint(x: bottomRight.x, y: bottomRight.y - radius)) // Move down to bottom-right without curve
        path.addArc(center: CGPoint(x: bottomRight.x - radius, y: bottomRight.y - radius),
                    radius: radius,
                    startAngle: .zero,
                    endAngle: .degrees(90),
                    clockwise: false) // Bottom-right corner
        
        path.addLine(to: CGPoint(x: bottomLeft.x + radius, y: bottomLeft.y)) // Line to bottom-left
        path.addArc(center: CGPoint(x: bottomLeft.x + radius, y: bottomLeft.y - radius),
                    radius: radius,
                    startAngle: .degrees(90),
                    endAngle: .degrees(180),
                    clockwise: false) // Bottom-left corner
        
        path.addLine(to: topLeft) // Close the path
        return path
    }
}

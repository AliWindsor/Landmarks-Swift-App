//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Alicia Windsor on 15/05/2021.
//

import SwiftUI
import CoreGraphics

struct BadgeBackground: View {
    var body: some View {
        
        GeometryReader{ geometry in
            //assuming container is 100x100, width = 100 & height = width
            Path{ path in
                
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                //use geometry to set the canvas to the size of phone
                let height = width
                
                //scale the shape on the x axis
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                
                path.move(to: CGPoint ( //moves drawing cursor within shape's bounds
                                x: width * 0.95 + xOffset,
                                y: height * 0.20 + HexagonParameters.adjustment )
                )
                
                HexagonParameters.segments.forEach { segment in
                    path.addLine( to: CGPoint(//takes line and draws it
                                        x: width * segment.line.x + xOffset,
                                        y: height * segment.line.y )
                    )
                    
                    path.addQuadCurve(to: CGPoint(
                                          x: width * segment.curve.x + xOffset,
                                          y: height * segment.curve.y),
                                      
                                      control: CGPoint(
                                          x: width * segment.control.x + xOffset,
                                          y: height * segment.control.y)
                                  )//draw bézier curves on the corners
                }
            }
            .fill(LinearGradient(
                gradient: Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        .aspectRatio(1, contentMode: .fit) //preserve aspect ratio
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}

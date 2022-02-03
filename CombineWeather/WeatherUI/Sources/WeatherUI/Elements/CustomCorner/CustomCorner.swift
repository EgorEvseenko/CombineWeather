//
//  CustomCorner.swift
//  CombineWeather
//
//  Created by Егор Евсеенко on 12.11.2021.
//

import SwiftUI

public struct CustomCorner: Shape {
    var corner: UIRectCorner
    var radius: CGFloat
    
    public init(corner: UIRectCorner, radius: CGFloat){
        self.corner = corner
        self.radius = radius 
    }
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
